#!/bin/bash

DRIVER=intel_backlight
BRIGHT_DIR=/sys/class/backlight/${DRIVER}
BRIGHT_FILE=${BRIGHT_DIR}/brightness
MAX_BRIGHT_FILE=${BRIGHT_DIR}/max_brightness
BRIGHTNESS=$(cat ${BRIGHT_FILE})
MAX_BRIGHT=$(cat ${MAX_BRIGHT_FILE})

case $1 in
    +*) 
        NEW_BRIGHT=$(($BRIGHTNESS + 100))
        ;;

    -*)
        NEW_BRIGHT=$(($BRIGHTNESS - 100))
        ;;

    FULL*)
        NEW_BRIGHT=${MAX_BRIGHT}
        ;;

    *)
        NEW_BRIGHT=$1
        ;;
esac

tee ${BRIGHT_FILE} <<< ${NEW_BRIGHT}
