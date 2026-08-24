#!/bin/sh
SESSION_NAME="dotfiles"

if ! tmux has-session -t "$SESSION_NAME" 2>/dev/null; then
  tmux new-session -s "$SESSION_NAME" -d -n editor -c "$DOTFILES" "vim .; zsh -l"
  tmux new-window -n git -t "$SESSION_NAME:" -c "$DOTFILES"
  tmux new-window -n misc -t "$SESSION_NAME:"
  tmux select-window -t "$SESSION_NAME:1"
fi

if [ -n "$TMUX" ]; then
  tmux switch-client -t "$SESSION_NAME"
else
  tmux attach-session -d -t "$SESSION_NAME"
fi
