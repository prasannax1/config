#!/bin/bash

lrun(){
    userhost=$1
    user=$(echo $userhost | cut -d@ -f1)
    if [ "x$user" = "x" ]; then
        user=ubuntu
    fi
    host=$(echo $userhost | cut -d@ -f2)
    shift
    lxc exec $host -- sudo --login --user $user $@
}

lsh(){
    lrun $@
}

v2gif () {
    for MP4 in "$@"; do
        pvar MP4
        NAME="$(echo "$MP4" | rev | cut -d"." -f2- | rev)"
        pvar NAME
        ffmpeg -i "$MP4" -r 10 -f image2pipe -vcodec ppm | \
            convert -delay 5 -loop 0 - "${NAME}.gif"
    done
}
