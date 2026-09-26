#!/usr/bin/env zsh
# macOS preferences. Idempotent: safe to re-run.
# Press-and-hold accent popup is intentionally left on (Romanian diacritics).

# Keyboard: fast key repeat
defaults write -g KeyRepeat -int 2
defaults write -g InitialKeyRepeat -int 15

# Text: no smart quotes/dashes, no autocorrect
defaults write -g NSAutomaticQuoteSubstitutionEnabled -bool false
defaults write -g NSAutomaticDashSubstitutionEnabled -bool false
defaults write -g NSAutomaticSpellingCorrectionEnabled -bool false

# Finder: extensions, hidden files, path bar
defaults write -g AppleShowAllExtensions -bool true
defaults write com.apple.finder AppleShowAllFiles -bool true
defaults write com.apple.finder ShowPathbar -bool true

# Dock: auto-hide, instant, fast animation
defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock autohide-delay -float 0
defaults write com.apple.dock autohide-time-modifier -float 0.2

# No .DS_Store on network drives
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

killall Dock Finder 2>/dev/null || true
