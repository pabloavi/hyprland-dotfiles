#!/usr/bin/env sh

# busctl --user call \
#     org.gnome.Shell \
#     /de/lucaswerkmeister/ActivateWindowByTitle \
#     de.lucaswerkmeister.ActivateWindowByTitle \
#     activateBySubstring \
#     s 'Firefox'

# ARGUMENTS:
# discord, whatsapp

case $1 in
discord)
	pgrep -x discord || discord &
	busctl --user call \
		org.gnome.Shell \
		/de/lucaswerkmeister/ActivateWindowByTitle \
		de.lucaswerkmeister.ActivateWindowByTitle \
		activateBySubstring \
		s 'Discord'
	;;
whatsapp)
	pgrep -x whatsapp-deskto || flatpak run io.github.mimbrero.WhatsAppDesktop &
	busctl --user call \
		org.gnome.Shell \
		/de/lucaswerkmeister/ActivateWindowByTitle \
		de.lucaswerkmeister.ActivateWindowByTitle \
		activateBySubstring \
		s 'WhatsApp'
	;;
outlook)
	output=$(busctl --user call \
		org.gnome.Shell \
		/de/lucaswerkmeister/ActivateWindowByTitle \
		de.lucaswerkmeister.ActivateWindowByTitle \
		activateBySubstring \
		s 'Outlook')
	if [ "$output" = "b true" ]; then
		exit 0
	fi
	firefox --new-window https://outlook.office.com/mail/inbox
	;;
*)
	echo "Usage: $0 {discord|whatsapp|outlook}"
	exit 1
	;;
esac
