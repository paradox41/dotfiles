alias la="ls -a"
alias l="ls -aG"

# Preferred 'cp' implementation
alias cp='cp -iv'

# Always list directory contents upon 'cd'
cd() {
    builtin cd "$@"; l;
}

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

# Stop and Remove all containers
docker_clean() {
    docker stop $(docker ps -a -q) && docker rm $(docker ps -a -q)
}

# Remove all images
docker_clean_images() {
    docker rmi $(docker images -q);
}

# mcd: Makes new Dir and jumps inside
mcd() {
    mkdir -p "$1" && cd "$1";
}

update_all_the_things() {
    upgrade_oh_my_zsh && brew update && brew upgrade && brew cleanup
}

# reload zshrc
alias refresh='source ~/.zshrc'
