echo 'Updating brew'
brew update

echo 'Upgrading exisiting brews'
brew upgrade

brews=($(cat brews.txt));

brew install ${brews[@]}
brew cleanup
