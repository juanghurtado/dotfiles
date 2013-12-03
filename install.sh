#!/bin/sh

if [ ! -d "$HOME/.dotfiles" ]; then
	git clone --recursive https://github.com/juanghurtado/dotfiles.git "$HOME/.dotfiles"
	cd "$HOME/.dotfiles"
	rake install
else
	echo "Dotfiles already installed. Please: cd ~/.dotfiles && git pull origin master && git submodule update && git submodule foreach git pull origin master"
fi
