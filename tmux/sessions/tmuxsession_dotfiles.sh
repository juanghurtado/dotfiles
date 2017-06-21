#!/bin/sh
SESSION_NAME="dotfiles"

tmux has-session -t $SESSION_NAME
if [ $? != 0 ]
then
  tmux new-session -s $SESSION_NAME -d -n editor -c $DOTFILES "vim .; zsh -l"
  tmux new-window -n git -t $SESSION_NAME: -c $DOTFILES
  tmux new-window -n misc -t $SESSION_NAME:
  tmux select-window -t $SESSION_NAME:1
  tmux attach-session -t $SESSION_NAME
fi

tmux switch-client -t $SESSION_NAME
