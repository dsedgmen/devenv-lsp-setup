#!/usr/bin/env bash
# Install Fedora vim-* plugins and Neovim plugins-config.lua.

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "Installing Neovim plugins from Fedora..."
sudo dnf install -y \
  vim-fugitive \
  vim-gitgutter \
  vim-nerdtree \
  vim-ctrlp \
  vim-commentary \
  vim-rhubarb \
  vim-trailing-whitespace \
  vim-powerline

mkdir -p ~/.config/nvim/lua
cp "$SCRIPT_DIR/plugins-config.lua" ~/.config/nvim/lua/plugins-config.lua
echo "Installed ~/.config/nvim/lua/plugins-config.lua"

if [ -f ~/.config/nvim/init.lua ] && grep -q 'plugins-config' ~/.config/nvim/init.lua 2>/dev/null; then
  echo "init.lua already soft-requires plugins-config"
else
  echo "Note: devenv-ai-assistant init.lua soft-requires plugins-config via pcall"
fi

echo ""
echo "Maps: <C-n> NERDTree | <C-p> CtrlP | <leader>gs Git status | ]c/[c hunks | gcc comment"
