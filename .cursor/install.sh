#!/usr/bin/env bash
# Cloud Agent environment bootstrap for these dotfiles.
#
# Idempotent: installs the system tools the dotfiles expect, symlinks the
# configs into $HOME, then pulls the tmux and vim plugins. Safe to re-run.
set -euo pipefail

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd -P)"
cd "$REPO_DIR"

# --- 1. System packages the dotfiles rely on but the base image lacks ---
# The Cursor default image already ships git, curl, vim and tmux.
export DEBIAN_FRONTEND=noninteractive
sudo apt-get update -qq
sudo apt-get install -y -qq zsh less silversearcher-ag todotxt-cli

# The dotfiles' aliases call `todo.sh`; Ubuntu ships the binary as `todo-txt`.
sudo ln -sfn /usr/bin/todo-txt /usr/local/bin/todo.sh

# --- 2. Capture any pre-existing git identity before the dotfiles take over
#        ~/.gitconfig, so commits keep working through ~/.gitconfig.local. ---
git_name="$(git config --global user.name 2>/dev/null || true)"
git_email="$(git config --global user.email 2>/dev/null || true)"

# --- 3. Symlink the dotfiles into $HOME ---
./install.sh

# install.sh seeds ~/.gitconfig.local from a placeholder example; restore the
# real identity (the dotfiles' gitconfig includes this machine-local file).
if [ -n "$git_name" ] && [ -n "$git_email" ]; then
  printf '[user]\n  name = %s\n  email = %s\n' "$git_name" "$git_email" \
    > "$HOME/.gitconfig.local"
fi

# --- 4. tmux plugin manager (tracked as a gitlink with no .gitmodules) ---
TPM_DIR="$REPO_DIR/tmux/plugins/tpm"
if [ ! -e "$TPM_DIR/tpm" ]; then
  rm -rf "$TPM_DIR"
  git clone --depth 1 https://github.com/tmux-plugins/tpm "$TPM_DIR"
fi
"$TPM_DIR/bin/install_plugins"

# --- 5. Vim plugins via vim-plug (vendored at vim/autoload/plug.vim) ---
vim -Es -u "$HOME/.vimrc" -c 'PlugInstall --sync' -c 'qall!' </dev/null || true
