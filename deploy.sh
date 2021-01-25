#!/bin/bash

WORKDIR="$(dirname $0)"

FILES=()
FILES+=(bashrc)
FILES+=(bash_functions)
FILES+=(inputrc)
FILES+=(vimrc)
FILES+=(zshrc)
FILES+=(kshrc)
FILES+=(tmux.conf)

for file in ${FILES[@]}
do
    cp ${WORKDIR}/${file} ~/.${file} -v
done

for app in i3status sway; do
    mkdir -pv ~/.config/${app}
    cp -v ${app}.config ~/.config/${app}/config
done
