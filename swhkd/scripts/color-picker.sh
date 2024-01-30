#!/bin/bash

case $XDG_SESSION_TYPE in
x11) gpick ;;
wayland) wl-color-picker ;;
esac
