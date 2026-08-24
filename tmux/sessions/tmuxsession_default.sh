#!/bin/sh
SESSION_NAME="default"

if ! tmux has-session -t "$SESSION_NAME" 2>/dev/null; then
  tmux new-session -s "$SESSION_NAME" -d -n main
fi

if [ -n "$TMUX" ]; then
  tmux switch-client -t "$SESSION_NAME"
else
  tmux attach-session -d -t "$SESSION_NAME"
fi
