#!/usr/bin/env sh

# structure:
# x11 or wayland
# fullscreen or select
# clipboard or file

case $XDG_SESSION_TYPE in
x11)
	for arg in "$@"; do
		case $arg in
		--select)
			for arg2 in "$@"; do
				case $arg2 in
				--clipboard)
					maim --select | xclip -selection clipboard -t image/png
					;;
				--file)
					maim --select "/home/$USER/Imágenes/$(date +%Y-%m-%d_%H:%M:%S).png"
					;;
				esac
			done
			;;
		--full)
			for arg2 in "$@"; do
				case $arg2 in
				--clipboard)
					maim | xclip -selection clipboard -t image/png
					;;
				--file)
					maim "/home/$USER/Imágenes/$(date +%Y-%m-%d_%H:%M:%S).png"
					;;
				esac
			done
			;;

		--sxiv)
			maim --select '/tmp/screenshot.png' && sxiv -b -a '/tmp/screenshot.png'
			;;
		*)
			echo "Usage: screenshot.sh [OPTION]..."
			return 1
			;;
		esac
	done
	;;
wayland)
	for arg in "$@"; do
		case $arg in
		--select)
			for arg2 in "$@"; do
				case $arg2 in
				--clipboard)
					pgrep -x slurp || wayshot -s "$(slurp)" --stdout | wl-copy
					;;
				--file)
					pgrep -x slurp || wayshot -s "$(slurp)" --stdout >"/home/$USER/Imágenes/$(date +%Y-%m-%d_%H:%M:%S).png"
					;;
				esac
			done
			;;
		--full)
			for arg2 in "$@"; do
				case $arg2 in
				--clipboard)
					wayshot --stdout | wl-copy
					;;
				--file)
					wayshot --stdout >"/home/$USER/Imágenes/$(date +%Y-%m-%d_%H:%M:%S).png"
					;;
				esac
			done
			;;
		--sxiv)
			date=$(date +%Y-%m-%d_%H:%M:%S)
			pgrep -x slurp || (wayshot -s "$(slurp)" --stdout >"/tmp/screenshot-$date.png" && sxiv -b -a "/tmp/screenshot-$date.png")
			;;
		esac
	done
	;;
esac
