#!/bin/bash

installer_dir="$(pwd)"

# hyprland
[ -f ~/.config/hypr ] && mv ~/.config/hypr/ ~/.config/hypr.bak
ln -s installer_dir/hypr ~/.config/hypr/

# swhkd
[ -f ~/.config/swhkd ] && mv ~/.config/swhkd ~/.config/swhkd.bak
ln -s installer_dir/swhkd ~/.config/swhkd

# wlogout
[ -f ~/.config/wlogout ] && mv ~/.config/wlogout ~/.config/wlogout.bak
ln -s installer_dir/wlogout ~/.config/wlogout
