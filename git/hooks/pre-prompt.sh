#!/bin/sh
# Allows us to read user input below, assigns stdin to keyboard
exec < /dev/tty

while true; do
	read -p "[pre-commit hook] Are you sure? Have you done everything you need to do: compilation, tests…? (Y/n) " yn
	if [ "$yn" = "" ]; then
		yn='Y'
	fi
	case $yn in
			[Yy] ) exit 0;;
			[Nn] ) exit 1;;
			* ) echo "Please answer y or n for yes or no.";;
	esac
done
