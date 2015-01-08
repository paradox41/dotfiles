# Install native apps

brew install caskroom/cask/brew-cask

# get different version
brew tap caskroom/versions

# install quick look plugins
# https://github.com/sindresorhus/quick-look-plugins
brew cask install qlcolorcode
brew cask install qlstephen
brew cask install qlmarkdown
brew cask install quicklook-json
brew cask install qlprettypatch
brew cask install quicklook-csv
brew cask install betterzipql
brew cask install webp-quicklook
brew cask install suspicious-package

# daily
brew cask install alfred
brew cask install dropbox

# dev
cask install virtualbox
cask install vagrant
brew cask install iterm2
brew cask install sublime-text3

# irc
brew cask install limechat

# browsers
brew cask install google-chrome-beta
brew cask install google-chrome-canary
brew cask install firefox
brew cask install chromium --force
