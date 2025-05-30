#! /usr/bin/env bash
#
# Configuring macOS preferences
#
# @author Charlie Revett (@revcd)

echo "> starting macos.sh"
echo "> setting preferences"

# ------------------------------
# Dock & Menu Bar
# ------------------------------

# Set Dock autohide delay
defaults write com.apple.dock autohide-delay -float 0.5

# Enable Dock autohide
defaults write com.apple.dock autohide -bool true

# Set datetime format in Menu Bar
defaults write com.apple.menuextra.clock "DateFormat" -string "\"EEE d MMM HH:mm:ss\""

# ------------------------------
# Finder
# ------------------------------

# Set Download as the default location for new Finder windows
# Use `PfLo` and `file:///full/path/here/`
defaults write com.apple.finder NewWindowTarget -string "PfLo"
defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}/Downloads/"

# Show hidden files.
defaults write com.apple.Finder AppleShowAllFiles true

# Use column view in all Finder windows by default
# Four-letter codes for the other view modes: `icnv`, `Nlsv`, `clmv`, `Flwv`
defaults write com.apple.finder FXPreferredViewStyle -string "clmv"

# ------------------------------
# General.
# ------------------------------

# Expand save panel by default
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true

# Expand print panel by default
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true

# Disable smart quotes as they’re annoying when typing code
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false

# Disable smart dashes as they’re annoying when typing code
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false

# ------------------------------
# Keyboard.
# ------------------------------

# Decrease key repeat
defaults write NSGlobalDomain KeyRepeat -int 1

# Decrease initial key repeat
defaults write NSGlobalDomain InitialKeyRepeat -int 12

# Disable press-and-hold for keys in favor of key repeat
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

# Disable auto-correct
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false

# ------------------------------
# Screen
# ------------------------------

# Save screenshots to specific folder
mkdir ~/Pictures/Screenshots
defaults write com.apple.screencapture location -string "~/Pictures/Screenshots"

# Do not show the thumbnail of a screenshot
defaults write com.apple.screencapture show-thumbnail -bool FALSE

# Save screenshots in PNG format (other options: BMP, GIF, JPG, PDF, TIFF)
defaults write com.apple.screencapture type -string "png"

# Require password immediately after sleep or screen saver begins
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0

# ------------------------------
# Quitting apps
# ------------------------------

echo "> quitting apps"

killall Dock
killall Finder
killall SystemUIServer

# ------------------------------
# Final
# ------------------------------

echo "> note: now restart the machine"
echo "> complete"
