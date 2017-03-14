#{{{System

# Full ls
alias ls="ls -FAlhoG"

# Clear screen
alias cl="clear"

# Always create full path
alias mkdir="mkdir -p"

# Easy navigation
alias ..="cd .."
alias ...="cd ../.."

# Output commands usage statistics
alias history-stat="history 0 | awk '{print \$2}' | sort | uniq -c | sort -n -r | head"

# Copy pubkey
alias pubkey="more ~/.ssh/id_rsa.pub | pbcopy | echo '=> Public key copied to pasteboard.'"

# Ips
alias ip="ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0.1' && dig +short myip.opendns.com @resolver1.opendns.com"

# Reload shell
alias reload="exec $SHELL -l"

#}}}
#{{{Apps

alias g="git"
alias tmux="tmux -2"

# Maven
alias mvnc="mvn clean"
alias mvnce="mvn clean eclipse:eclipse"
alias mvnv="mvn -q -Dexec.executable='echo' -Dexec.args='\${project.version}' --non-recursive org.codehaus.mojo:exec-maven-plugin:1.3.1:exec"

# Todo.txt
alias t='todo.sh -A -T -d $HOME/.todo.cfg'
alias to='t ls @office'
alias th='t ls @home'
alias tp='t ls @personal'
alias te='vim ~/.todo/todo.txt'

#}}}
#{{{Utils

alias weather="curl http://wttr\.in/sevilla"

#}}}

# vim:foldmethod=marker:foldlevel=0:fen
