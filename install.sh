#!/bin/sh

if [ ! -d "$HOME/.dotfiles" ]; then
	git clone --recursive https://github.com/juanghurtado/dotfiles.git "$HOME/.dotfiles"
	cd "$HOME/.dotfiles"
	rake install
fi
