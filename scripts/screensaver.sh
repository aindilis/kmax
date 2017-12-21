#!/bin/bash

if [ `hostname -f` == "ai.frdcsa.org" ]; then
    i3lock -c 000000
elif [ `ps auxwww | grep -v grep | grep xscreensaver | wc -l` -gt 0 ]; then
    xscreensaver-command -l &
elif [ `ps auxwww | grep -v grep | grep gnome-screensaver | wc -l` -gt 0 ]; then
    gnome-screensaver-command -l &
else
    xscreensaver &
    sleep 2
    xscreensaver-command -l &
fi
