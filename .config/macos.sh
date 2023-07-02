# Instantaneously show/hide dock
defaults write com.apple.dock autohide-delay -float 0
defaults write com.apple.dock autohide-time-modifier -int 0

# Disable press-and-hold for keys in favor of key repeat
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

# Speed up Mission Control animations
defaults write com.apple.dock expose-animation-duration -int 0

killall Dock
