# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/ubuntu/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall


autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "$key[Up]" up-line-or-beginning-search # Up
bindkey "$key[Down]" down-line-or-beginning-search # Down

setopt prompt_subst
autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git svn
#zstyle ':vcs_info:git*' formats "%s  %r/%S %b (%a) %m%u%c "

precmd() {
    vcs_info
}

prompt_user='%F{yellow}%n%f'
prompt_host='%F{red}@%m%f'
prompt_path='%F{blue}%/%f'
prompt_git='%F{green}${vcs_info_msg_0}%f'
prompt_newline=$'\n'
prompt_prompt='%(?.%K{black}.%K{red})%(?.%F{white}.%F{black})%B%%%b%f%k'
prompt_clock='%F{cyan}%*%f'

PROMPT="${prompt_user}${prompt_host} ${prompt_path} "'${ivcs_info_msg_0}'"${prompt_newline}${prompt_prompt} "
RPROMPT="${prompt_clock}"

PROMPT='%F{yellow}%n%F{red}@%m %F{blue}%/%f %F{green}${vcs_info_msg_0_}%f'$'\n''%(?.%K{black}.%K{red})%(?.%F{white}.%F{black})%B%%%b%f%k '
RPROMPT='%F{cyan}%*%f'

alias vi=vim
alias cd..="cd .."
alias ks=ls
alias diff='diff --color=auto'
alias grep='grep --color=auto'
alias ls='ls --color=auto'
alias ip='ip -color=auto'
alias gti=git

if [[ -f ~/.zsh_functions ]]; then
    source ~/.zsh_functions
fi

