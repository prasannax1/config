# Source global definitions
if [ -f /etc/kshrc ]; then
	. /etc/kshrc
fi

PS1="${USER}@${HOSTNAME} \${PWD} \$ "
mkcd() {
    mkdir $1 && cd $1
}

set -o vi

# User specific aliases and functions
alias vi=vim
alias cd..="cd .."
alias ks=ls
alias diff='diff --color=auto'
alias grep='grep --color=auto'
alias ls='ls --color=auto'
