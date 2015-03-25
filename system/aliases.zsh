# Full ls
alias ls="ls -FAlhoG"

# Pipe my public key to my clipboard. Fuck you, pay me.
alias pubkey="more ~/.ssh/id_rsa.pub | pbcopy | echo '=> Public key copied to pasteboard.'"

# Update
alias update='sudo softwareupdate -i -a; brew update; brew upgrade; brew cleanup; npm update -g; gem update'

# IP addresses
alias localip="ipconfig getifaddr en1"
alias ips="ifconfig -a | grep -o 'inet6\? \(\([0-9]\+\.[0-9]\+\.[0-9]\+\.[0-9]\+\)\|[a-fA-F0-9:]\+\)' | sed -e 's/inet6* //'"

# Empty the Trash on all mounted volumes and the main HDD
alias emptytrash="sudo rm -rfv /Volumes/**/.Trashes; sudo rm -rfv ~/.Trash"

# Clear screen
alias cl="clear"
