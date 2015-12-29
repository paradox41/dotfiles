parse_git_dirty() {
    [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit, working directory clean" ]] && echo "+"
}

parse_git_branch() {
    git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/\1$(parse_git_dirty)/"
}

prompt_setup() {
    # PROMPT="\[\e[0;32m\]\w\[\033[35m\]:$(parse_git_branch)\[\e[m\] λ\[\033[00m\]%f "
    PROMPT="%F{green}%~%F{242}%f%F{magenta}:`parse_git_branch`%f λ "
}

prompt_setup "$@"
