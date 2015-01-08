# update to the latest homebrew
echo 'Updating brew'
brew update

echo 'Upgrading exisiting brews'
# upgrade exisiting brews
brew upgrade

brews=(
    'gcc'
    'git'
    'wget'
    'dart'
    'go'
    'automake'
    'openssl'
    'numpy'
    'phantomjs'
    'python'
    'htop-osx'
    'libxml2'
);

brew install ${brews[@]}
brew cleanup
