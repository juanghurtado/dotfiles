export TODOTXT_SORT_COMMAND='env LC_COLLATE=C sort -k 2,2 -k 1,1n'
export TODOTXT_DEFAULT_ACTION=ls

alias t='todo.sh -A -T -d $HOME/.todo.cfg'
alias to='t ls @office'
alias th='t ls @home'
alias tp='t ls @personal'
