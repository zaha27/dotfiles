# dotfiles

My Mac setup (Apple Silicon, zsh, Homebrew, mise, Docker Desktop).

## Rebuild a machine

```sh
git clone https://github.com/zaha27/dotfiles ~/dotfiles
~/dotfiles/install.sh
```

## Layout

| Path | What | Installed as |
|---|---|---|
| `Brewfile` | CLI tools, apps, VS Code extensions | `brew bundle` |
| `zsh/.zshrc` | shell config | symlink `~/.zshrc` |
| `mise/config.toml` | global runtimes (node LTS) | symlink `~/.config/mise/config.toml` |
| `claude/CLAUDE.md` | global Claude Code instructions | symlink `~/.claude/CLAUDE.md` |
| `claude/settings.json` | Claude Code settings snapshot | copied if missing |
| `backup/` | old dotfiles replaced by install.sh (gitignored) | — |

## Adding things

- **Claude skill/plugin:** lives in [zaha27/skills](https://github.com/zaha27/skills), cloned to
  `~/Documents/GitHub/skills` and linked by `install.sh`.
- **Brew package:** `brew install x`, then add it to `Brewfile` in the right section.
- **Claude settings changed:** `jq 'del(.autoMode)' ~/.claude/settings.json > claude/settings.json`
  (drops `autoMode`, which holds machine-specific repo/org names; this repo is public).
