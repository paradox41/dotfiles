# set editor
export EDITOR='subl'

# grep options
export GREP_OPTIONS='--color=auto --exclude=*.pyc --exclude-dir=.git'

# go
export GOPATH=$HOME/code/go

# path
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:$GOPATH/bin:$HOME/.cargo/bin"
export PATH="$HOME/Library/Python/2.7/bin:$HOME/Library/Python/3.6/bin:$PATH"

# don't include duplicates in bash history
export HISTCONTROL=ignoreboth:erasedups
