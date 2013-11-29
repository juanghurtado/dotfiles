# NPM list without dependencies
function npmls() {
  npm ls --depth=0 "$@" 2>/dev/null
}

# NPM list (global) without dependencies
function npmgls() {
  npm -g ls --depth=0 "$@" 2>/dev/null
}