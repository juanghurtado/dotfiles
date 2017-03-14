#!/bin/sh
SESSION_NAME="default"

tmux has-session -t $SESSION_NAME
if [ $? != 0 ]
then
  tmux new-session -s $SESSION_NAME -d -n main
  tmux select-window -t $SESSION_NAME:1
  tmux attach-session -d -t $SESSION_NAME
fi

tmux switch-client -t $SESSION_NAME
