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
| `claude/skills/<name>/SKILL.md` | my Claude Code skills | symlink per skill into `~/.claude/skills/` |
| `claude/plugins/<name>/` | my Claude Code plugins | via the marketplace below |
| `claude/settings.json` | Claude Code settings snapshot | copied if missing |
| `.claude-plugin/marketplace.json` | plugin marketplace for `claude/plugins` | `/plugin marketplace add zaha27/dotfiles` |
| `backup/` | old dotfiles replaced by install.sh (gitignored) | — |

## Adding things

- **Skill:** create `claude/skills/<name>/SKILL.md`, run `./install.sh`.
- **Plugin:** create `claude/plugins/<name>/.claude-plugin/plugin.json` (+ skills/commands/agents),
  add `{ "name": "<name>", "source": "./claude/plugins/<name>" }` to `.claude-plugin/marketplace.json`,
  then `claude plugin validate .` and in Claude Code: `/plugin install <name>@zaha-dotfiles`.
- **Brew package:** `brew install x`, then add it to `Brewfile` in the right section.
- **Claude settings changed:** `jq 'del(.autoMode)' ~/.claude/settings.json > claude/settings.json`
  (drops `autoMode`, which holds machine-specific repo/org names; this repo is public).
