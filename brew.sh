echo 'Updating brew'
brew update

echo 'Tap all the brews'
brew tap dart-lang/dart

echo 'Install custom brews'
brew install TomAnthony/brews/itermocil

echo 'Upgrading exisiting brews'
brew upgrade --all

brews=($(cat brews.txt));

brew install ${brews[@]}
brew cleanup
