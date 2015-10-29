# set editor
export EDITOR='subl'

# grep options
export GREP_OPTIONS='--color=auto --exclude=*.pyc --exclude-dir=.git'

# nvm
export NVM_DIR=$HOME/.nvm

# go
export GOPATH=$HOME/Projects/go

# path
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:$GOPATH/bin"

# This loads nvm
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
