# Install native apps

echo 'Installing brew cask';
brew install caskroom/cask/brew-cask

# get different version
echo 'Tapping caskroom/versions'
brew tap caskroom/versions

echo 'Tapping caskroom/fonts'
brew tap caskroom/fonts

casks=($(cat casks.txt));

brew cask install ${casks[@]}
brew cask cleanup
