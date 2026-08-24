# Shared PATH setup. Sourced from zshenv (all shells) and zprofile
# (login shells, after macOS path_helper rewrites PATH).
typeset -U path
path=(
  ~/bin
  $DOTFILES/bin
  $DOTFILES/tmux/sessions
  ~/.local/bin
  /usr/local/bin
  $path[@]
)
