#!/usr/bin/env zsh
# Rebuild this machine from ~/dotfiles. Idempotent: safe to re-run.
set -euo pipefail
DOT="${0:A:h}"

link() {  # link <source-in-repo> <target>
  local src="$DOT/$1" dst="$2"
  mkdir -p "${dst:h}"
  if [[ -L "$dst" && "$(readlink "$dst")" == "$src" ]]; then return; fi
  if [[ -e "$dst" || -L "$dst" ]]; then
    local bak="$DOT/backup/$(date +%Y-%m-%d-%H%M)"
    mkdir -p "$bak" && mv "$dst" "$bak/" && echo "backed up $dst -> $bak/"
  fi
  ln -s "$src" "$dst" && echo "linked $dst"
}

# 1. Homebrew packages
command -v brew >/dev/null || /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew bundle --file="$DOT/Brewfile" || echo "warning: some Brewfile entries failed"

# 2. Shell + runtimes
link zsh/.zshrc ~/.zshrc
link mise/config.toml ~/.config/mise/config.toml
link git/gitignore_global ~/.gitignore_global
link vim/.vimrc ~/.vimrc
git config --global core.excludesfile ~/.gitignore_global
mise install

# 3. Claude Code: global CLAUDE.md, settings (copied, Claude rewrites it)
link claude/CLAUDE.md ~/.claude/CLAUDE.md
[[ -e ~/.claude/settings.json ]] || cp "$DOT/claude/settings.json" ~/.claude/settings.json

# 3b. Claude skills & plugins (separate repo: github.com/zaha27/skills)
SKILLS=~/Documents/GitHub/skills
[[ -d $SKILLS ]] || git clone https://github.com/zaha27/skills "$SKILLS"
git -C "$SKILLS" pull --ff-only || echo "warning: could not update $SKILLS"
"$SKILLS/install.sh"

# 4. macOS defaults
[[ -x "$DOT/macos-defaults.sh" ]] && "$DOT/macos-defaults.sh"

echo "done. open a new terminal."
