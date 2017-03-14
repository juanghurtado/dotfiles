#!/bin/sh
SESSION_NAME="fortress"

tmux has-session -t $SESSION_NAME
if [ $? != 0 ]
then
  tmux new-session -s $SESSION_NAME -d -n fortress -c "$HOME/dev/workspace-neon/viafirma-fortress"
  tmux new-window -n fortress-sdk -t $SESSION_NAME: -c "$HOME/dev/workspace-neon/viafirma-fortress-sdk-java"
  tmux new-window -n fortress-demo -t $SESSION_NAME: -c "$HOME/dev/workspace-neon/viafirma-fortress-demo"
  tmux new-window -n misc -t $SESSION_NAME:
  tmux select-window -t $SESSION_NAME:1
  tmux attach-session -t $SESSION_NAME
fi

tmux switch-client -t $SESSION_NAME
