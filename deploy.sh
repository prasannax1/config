#!/bin/bash

WORKDIR="$(dirname $0)"
cp -v ${WORKDIR}/.*rc ~/
for app in i3status sway; do
    mkdir -pv ~/.config/${app}
    cp -v ${app}.config ~/.config/${app}/config
done
