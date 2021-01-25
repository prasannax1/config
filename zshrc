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

PROMPT='%F{yellow}%n%F{red}@%m %F{blue}%/%f'$'\n''%(?.%K{black}.%K{red})%F{white}%%%f%k '
RPROMPT='%F{cyan}%*%f'
