# Taken mostly from Pure and modified

# fastest possible way to check if repo is dirty
prompt_lamdba_git_dirty() {
    # check if we're in a git repo
    [[ "$(command git rev-parse --is-inside-work-tree 2>/dev/null)" == "true" ]] || return
    # check if it's dirty
    [[ "$PURE_GIT_UNTRACKED_DIRTY" == 0 ]] && local umode="-uno" || local umode="-unormal"
    command test -n "$(git status --porcelain --ignore-submodules ${umode})"

    (($? == 0)) && echo '*'
}

# string length ignoring ansi escapes
prompt_lambda_string_length() {
    # Subtract one since newline is counted as two characters
    echo $(( ${#${(S%%)1//(\%([KF1]|)\{*\}|\%[Bbkf])}} - 1 ))
}

prompt_lambda_precmd() {
    # shows the full path in the title
    print -Pn '\e]0;%~\a'

    # git info
    vcs_info

    local prompt_lambda_preprompt="%F{green}%~%F{242}%f%F{magenta}:%F{magenta}$vcs_info_msg_0_`prompt_lamdba_git_dirty`%f "
    print -P $prompt_lambda_preprompt

    # check async if there is anything to pull
    (( ${PURE_GIT_PULL:-1} )) && {
        # check if we're in a git repo
        [[ "$(command git rev-parse --is-inside-work-tree 2>/dev/null)" == "true" ]] &&
        # make sure working tree is not $HOME
        [[ "$(command git rev-parse --show-toplevel)" != "$HOME" ]] &&
        # check check if there is anything to pull
        # set GIT_TERMINAL_PROMPT=0 to disable auth prompting for git fetch (git 2.3+)
        GIT_TERMINAL_PROMPT=0 command git -c gc.auto=0 fetch &>/dev/null &&
        # check if there is an upstream configured for this branch
        command git rev-parse --abbrev-ref @'{u}' &>/dev/null && {
            local arrows=''
            (( $(command git rev-list --right-only --count HEAD...@'{u}' 2>/dev/null) > 0 )) && arrows='⇣'
            (( $(command git rev-list --left-only --count HEAD...@'{u}' 2>/dev/null) > 0 )) && arrows+='⇡'
            print -Pn "\e7\e[A\e[1G\e[`prompt_lambda_string_length $prompt_lambda_preprompt`C%F{cyan}${arrows}%f\e8"
        }
    } &!

    # reset value since `preexec` isn't always triggered
    # unset cmd_timestamp
}

prompt_lambda_setup() {
    # prevent percentage showing up
    # if output doesn't end with a newline
    export PROMPT_EOL_MARK=''

    autoload -Uz add-zsh-hook
    autoload -Uz vcs_info

    add-zsh-hook precmd prompt_lambda_precmd

    zstyle ':vcs_info:*' enable git
    zstyle ':vcs_info:*' use-simple true
    zstyle ':vcs_info:git*' formats ' %b'
    zstyle ':vcs_info:git*' actionformats ' %b|%a'

    # show username@host if logged in through SSH
    [[ "$SSH_CONNECTION" != '' ]] && prompt_pure_username=' %n@%m'

    # show username@host if root, with username in white
    [[ $UID -eq 0 ]] && prompt_pure_username=' %F{white}%n%F{242}@%m'

    PROMPT="λ "
}

prompt_lambda_setup "$@"
