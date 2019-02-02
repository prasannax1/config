# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
alias vi=vim
alias cd..="cd .."
alias ks=ls
alias diff='diff --color=auto'
alias grep='grep --color=auto'
alias ls='ls --color=auto'

export LESS='-XFR'
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

export HISTFILESIZE=20000
export HISTSIZE=10000
shopt -s histappend
# Combine multiline commands into one in history
shopt -s cmdhist
# Ignore duplicates, ls without options and builtin commands
HISTCONTROL=ignoredups
export HISTIGNORE="&:ls:[bf]g:exit"

function mkcd {
  mkdir -pv $1 && cd $1
}

shopt -s autocd

if [[ $- == *i* ]]; then
    GREEN="\[$(tput setaf 2)\]"
    RED="\[$(tput setaf 1)\]"
    BLUE="\[$(tput setaf 4)\]"
    YELLOW="\[$(tput setaf 3)\]"
    MAGENTA="\[$(tput setaf 5)\]"
    CYAN="\[$(tput setaf 6)\]"
    WHITE="\[$(tput setaf 7)\]"
    BLACK="\[$(tput setaf 0)\]"
    BGREEN="\[$(tput setab 2)\]"
    BRED="\[$(tput setab 1)\]"
    BBLUE="\[$(tput setab 4)\]"
    BYELLOW="\[$(tput setab 3)\]"
    BMAGENTA="\[$(tput setab 5)\]"
    BCYAN="\[$(tput setab 6)\]"
    BWHITE="\[$(tput setab 7)\]"
    BBLACK="\[$(tput setab 0)\]"
    RESET="\[$(tput sgr0)\]"
fi

PS1="${YELLOW}\u${RED}@\h ${BLUE}\w ${BBLACK}${WHITE}\$${RESET} "
PS2="${YELLOW}>${RESET} "
PS4="${RED}+${RESET} "

## prompt override
## because I put stuff in tmux
if [ "$TERM" = "screen" ] && [ -n "$TMUX" ]; then
    PS1="${GREEN}\$(date +%H:%M:%S) ${BBLACK}${WHITE}\$${RESET} "
fi

PROMPT_COMMAND=prompt_function
prompt_function() {
    local RET="$?" CMD="$_"
    local RED="$(tput setaf 1)"
    local GREEN="$(tput setaf 2)"
    local YELLOW="$(tput setaf 3)"
    local BLUE="$(tput setaf 4)"
    local RESET="$(tput sgr0)"
    if [ $RET != 0 ]; then
        echo -ne "${YELLOW}[${RED}${RET} ${YELLOW}${CMD}]${RESET} "
    fi
    local GIT_BRANCH="$(git describe --all 2>/dev/null)"
    if [[ "x${GIT_BRANCH}" != "x" ]]; then
        mcount="$(git status -s | wc -l)"
        if [ $mcount != 0 ]; then
            echo -ne "${YELLOW}<${BLUE}${GIT_BRANCH} ${RED}(+${mcount})${YELLOW}>${RESET} "
        else
            echo -ne "${YELLOW}<${BLUE}${GIT_BRANCH}${YELLOW}>${RESET} "
        fi
    fi
}

set -o vi
complete -cf sudo

pvar() {
    for var in $@; do
        echo "\$${var} = ${!var}"
    done
}

# User defined aliases
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# User defined functions
if [ -f ~/.bash_functions ]; then
    . ~/.bash_functions
fi
