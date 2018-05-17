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

PS1="${YELLOW}\u${RED}@\h ${BLUE}\w ${BWHITE}${BLACK}\$${RESET} "

set -o vi
complete -cf sudo

lsh() {
    host=$1
    lxc exec $host -- su - pras
}

# User defined aliases
if [ -f ~/.bash_aliases]; then
    ~/.bash_aliases
fi

