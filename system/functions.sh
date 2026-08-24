#{{{System

# Create a new directory and enter it
function mkd() {
  mkdir -p "$@" && cd "$_";
}

# Determine size of a file or total size of a directory
function fs() {
  local arg
  setopt local_options null_glob
  if du -b /dev/null > /dev/null 2>&1; then
    arg=-sbh
  else
    arg=-sh
  fi
  if (( $# )); then
    du $arg -- "$@"
  else
    du $arg -- .[^.]* *
  fi
}

# Copy the first available SSH public key to the clipboard.
function pubkey() {
  local key
  for key in "$HOME/.ssh/id_ed25519.pub" "$HOME/.ssh/id_rsa.pub"; do
    [[ -f "$key" ]] || continue
    if command -v pbcopy >/dev/null 2>&1; then
      pbcopy < "$key"
    elif command -v xclip >/dev/null 2>&1; then
      xclip -selection clipboard < "$key"
    elif command -v wl-copy >/dev/null 2>&1; then
      wl-copy < "$key"
    else
      cat "$key"
      return 0
    fi
    echo "=> Public key copied to pasteboard. ($key)"
    return 0
  done
  echo "No public key found in ~/.ssh" >&2
  return 1
}

#}}}

# vim:foldmethod=marker:foldlevel=0:fen
