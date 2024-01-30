#!/bin/bash

# get absolute directory of installer
installer_dir=$(dirname $(realpath $0))
echo $installer_dir

# hyprland
[ ! -f ~/.config/hypr ] || mv ~/.config/hypr/ ~/.config/hypr.bak
ln -s $installer_dir/hypr ~/.config/

# swhkd
[ ! -f ~/.config/swhkd ] || mv ~/.config/swhkd ~/.config/swhkd.bak
ln -s $installer_dir/swhkd ~/.config/

# wlogout
[ ! -f ~/.config/wlogout ] || mv ~/.config/wlogout ~/.config/wlogout.bak
ln -s $installer_dir/wlogout ~/.config/

# waybar
[ ! -f ~/.config/hypr ] || mv ~/.config/waybar/ ~/.config/waybar.bak
ln -s $installer_dir/waybar ~/.config/
