#!/usr/bin/env bash

set -euo pipefail

DOTFILES=$(cd "$(dirname "$0")" && pwd -P)

realpath_portable() {
  local target=$1
  if [[ -d "$target" ]]; then
    (cd "$target" && pwd -P)
  elif [[ -e "$target" ]]; then
    echo "$(cd "$(dirname "$target")" && pwd -P)/$(basename "$target")"
  else
    echo "$target"
  fi
}

backup_and_link() {
  local src=$1 dest=$2

  if [[ ! -e "$src" ]]; then
    echo "skip missing $src" >&2
    return 0
  fi

  mkdir -p "$(dirname "$dest")"

  if [[ -L "$dest" && $(readlink "$dest") == "$src" ]]; then
    return 0
  fi

  if [[ -e "$dest" && "$(realpath_portable "$src")" == "$(realpath_portable "$dest")" ]]; then
    return 0
  fi

  if [[ -e "$dest" || -L "$dest" ]]; then
    local bak="${dest}.bak.$(date +%Y%m%d%H%M%S)"
    mv "$dest" "$bak"
    echo "backed up $dest -> $bak"
  fi

  ln -sfn "$src" "$dest"
  echo "linked $dest -> $src"
}

copy_if_missing() {
  local src=$1 dest=$2

  if [[ ! -e "$src" ]]; then
    echo "skip missing $src" >&2
    return 0
  fi

  if [[ -e "$dest" ]]; then
    return 0
  fi

  cp "$src" "$dest"
  echo "created $dest from $(basename "$src")"
}

# Dotfiles folder
backup_and_link "$DOTFILES" "$HOME/.dotfiles"

# ZSH
backup_and_link "$DOTFILES/zsh/zshenv" "$HOME/.zshenv"
backup_and_link "$DOTFILES/zsh/zprofile" "$HOME/.zprofile"
backup_and_link "$DOTFILES/zsh/zshrc" "$HOME/.zshrc"
backup_and_link "$DOTFILES/zsh/zlogin" "$HOME/.zlogin"
copy_if_missing "$DOTFILES/zsh/zshrc.local.example" "$HOME/.zshrc.local"

# Tmux
backup_and_link "$DOTFILES/tmux/tmux.conf" "$HOME/.tmux.conf"
backup_and_link "$DOTFILES/tmux" "$HOME/.tmux"

# Vim
backup_and_link "$DOTFILES/vim/vimrc" "$HOME/.vimrc"
backup_and_link "$DOTFILES/vim" "$HOME/.vim"

# Git
backup_and_link "$DOTFILES/git/gitignore" "$HOME/.gitignore"
backup_and_link "$DOTFILES/git/gitconfig" "$HOME/.gitconfig"
copy_if_missing "$DOTFILES/git/gitconfig.local.example" "$HOME/.gitconfig.local"

# Todo.txt
backup_and_link "$DOTFILES/todo-txt/todo.cfg" "$HOME/.todo.cfg"
mkdir -p "$HOME/.todo"
