#!/usr/bin/env zsh
# macOS preferences. Idempotent: safe to re-run.
# Left at macOS defaults on purpose: key repeat speed, press-and-hold accent popup, Dock auto-hide.

# Text: no smart quotes/dashes, no autocorrect
defaults write -g NSAutomaticQuoteSubstitutionEnabled -bool false
defaults write -g NSAutomaticDashSubstitutionEnabled -bool false
defaults write -g NSAutomaticSpellingCorrectionEnabled -bool false

# Finder: extensions, hidden files, path bar
defaults write -g AppleShowAllExtensions -bool true
defaults write com.apple.finder AppleShowAllFiles -bool true
defaults write com.apple.finder ShowPathbar -bool true

# No .DS_Store on network drives
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

killall Finder 2>/dev/null || true
