#!/usr/bin/env bash

DOTFILES=$(pwd -P)

# Dotfiles folder
ln -sfn "$DOTFILES" "$HOME/.dotfiles"

# ZSH
ln -sfn "$DOTFILES/zsh/zshenv" "$HOME/.zshenv"
ln -sfn "$DOTFILES/zsh/zshrc" "$HOME/.zshrc"

# Tmux
ln -sfn "$DOTFILES/tmux/tmux.conf" "$HOME/.tmux.conf"
ln -sfn "$DOTFILES/tmux" "$HOME/.tmux"

# Vim
ln -sfn "$DOTFILES/vim/vimrc" "$HOME/.vimrc"
ln -sfn "$DOTFILES/vim" "$HOME/.vim"

# Git
ln -sfn "$DOTFILES/git/githelpers" "$HOME/.githelpers"
ln -sfn "$DOTFILES/git/gitignore" "$HOME/.gitignore"
ln -sfn "$DOTFILES/git/gitconfig" "$HOME/.gitconfig"

# Todo.txt
ln -sfn "$DOTFILES/todo-txt/todo.cfg" "$HOME/.todo.cfg"
mkdir -p "$HOME/.todo"
