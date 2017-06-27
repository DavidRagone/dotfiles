ruby -e "$(curl -fsSkl raw.github.com/mxcl/homebrew/go)"
brew doctor
brew install iterm
brew install automake
brew install git
git clone https://github.com/chriskempson/tomorrow-theme.git
curl -L https://github.com/robbyrussel/oh-my-zsh/raw/master/tools/install.sh | sh
chsh -s /bin/zsh

brew install tmux
brew install reattach-to-user-namespce
sudo ln -s /usr/bin/llvm-gcc-4.2 /usr/bin/gcc-4.2
brew install qt
brew install ack

defaults write NSGlobalDomain AppleKeyboardUIMode -int 3
defaults write com.apple.dock showhidden -bool true
defaults write NSGlobalDomain AppleShowAllExtensions -bool true
defaults write com.apple.finder ShowPathbar -bool true
defaults write com.apple.LaunchService LSQuarantine -bool false
defaults write com.apple.screencapture disable-shadow -bool true
defaults write com.apple.dock mouse-over-hilte-stack -bool true
defaults write com.apple.dock show-process-indicators -bool true
defaults write NSGlobalDomain KeyRepeat -int 0.02
defaults write NSGlobalDomain InitialKeyRepeat -int 12
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false
defaults write com.apple.frameworks.diskimages auto-open-ro-root -bool true
defaults write com.apple.frameworks.diskimages auto-open-rw-root -bool true
defaults write com.apple.finder OpenWindowForNewRemovableDisk -bool true
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0

brew install postgres
initdb /usr/local/var/postgres
ln -sfv /usr/local/opt/postgresql/*.plist ~/Library/LaunchAgents
launchctl load ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist
psql -d postgres -h localhost
http://xquartz.macosforge.com/landing

brew install nginx
sudo cp doc/nginx.conf /usr/local/etc/nginx
sudo nginx

# in vim, run BundleInstall (make sure to manually get vundle)
# install the font file (manually???)



