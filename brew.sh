# update to the latest homebrew
echo 'Updating brew'
brew update

echo 'Tap all the brews'
brew tap dart-lang/dart

echo 'Upgrading exisiting brews'
# upgrade exisiting brews
brew upgrade --all

brews=($(cat brews.txt));

brew install ${brews[@]}
brew cleanup
