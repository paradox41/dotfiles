# update to the latest homebrew
echo 'Updating brew'
brew update

echo 'Upgrading exisiting brews'
# upgrade exisiting brews
brew upgrade --all

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
    'ansible'
);

brew install ${brews[@]}
brew cleanup
