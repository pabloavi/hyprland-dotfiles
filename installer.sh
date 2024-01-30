#!/bin/bash

installer_dir="$(pwd)"

# hyprland
mv ~/.config/hypr/ ~/.config/hypr.bak
ln -s installer_dir/hypr ~/.config/hypr/hyprland.conf

# swhkd
mv ~/.config/swhkd ~/.config/swhkd.bak
ln -s installer_dir/swhkd ~/.config/swhkd

# wlogout
mv ~/.config/wlogout ~/.config/wlogout.bak
ln -s installer_dir/wlogout ~/.config/wlogout
