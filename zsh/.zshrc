# ~/.zshrc — symlinked from ~/dotfiles/zsh/.zshrc

# History
HISTFILE=~/.zsh_history
HISTSIZE=50000
SAVEHIST=50000
setopt SHARE_HISTORY HIST_IGNORE_DUPS HIST_IGNORE_SPACE

# Completion
autoload -Uz compinit
compinit -C

# Runtimes (node etc.)
eval "$(mise activate zsh)"

# Tools
eval "$(zoxide init zsh)"   # z <dir>
[[ -t 0 ]] && source <(fzf --zsh)   # Ctrl+R history, Ctrl+T files

# Aliases
alias ls='eza'
alias ll='eza -la --git'
alias lt='eza --tree --level=2'
alias lg='lazygit'
