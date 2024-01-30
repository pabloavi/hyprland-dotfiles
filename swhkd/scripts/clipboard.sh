#!/bin/bash

case $XDG_SESSION_TYPE in
x11) rofi -modi "clipboard:greenclip print" -show clipboard -run-command '{cmd}' ;;
wayland) clipman pick -t rofi ;;
esac
