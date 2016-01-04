alias la="ls -a"
alias l="ls -aG"

# Preferred 'cp' implementation
alias cp='cp -iv'

# Always list directory contents upon 'cd'
cd() { builtin cd "$@"; l; }

# Go back 1 directory level
alias ..='cd ../'
# Go back 2 directory levels
alias ...='cd ../../'
# Go back 3 directory levels
alias .3='cd ../../../'
# Go back 4 directory levels
alias .4='cd ../../../../'
# Go back 5 directory levels
alias .5='cd ../../../../../'
# Go back 6 directory levels
alias .6='cd ../../../../../../'
# ~: Go Home
alias ~='cd ~'
# c: Clear terminal display
alias c='clear'
# start a docker shell
alias docker-quickstart="bash --login '/Applications/Docker/Docker Quickstart Terminal.app/Contents/Resources/Scripts/start.sh'"

# mcd: Makes new Dir and jumps inside
mcd() {
    mkdir -p "$1" && cd "$1";
}

update_all_the_things() {
    upgrade_oh_my_zsh && brew update && brew upgrade --all && gem update
}

# reload zshrc
alias refresh='source ~/.zshrc'
