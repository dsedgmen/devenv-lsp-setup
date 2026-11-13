#!/usr/bin/env bash
# Install Neovim LSP / Treesitter Lua modules from devenv-lsp-setup.

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "Installing devenv-lsp-setup → ~/.config/nvim/lua/"
mkdir -p ~/.config/nvim/lua
cp "$SCRIPT_DIR/lsp-config.lua" ~/.config/nvim/lua/lsp-config.lua
cp "$SCRIPT_DIR/treesitter-config.lua" ~/.config/nvim/lua/treesitter-config.lua

echo "Installed:"
echo "  ~/.config/nvim/lua/lsp-config.lua"
echo "  ~/.config/nvim/lua/treesitter-config.lua"
echo ""
echo "Optional:"
echo "  ./install-lsp-treesitter.sh       # Fedora LSP servers + grammars"
echo "  ./install-treesitter-languages.sh # Extra language parsers"
echo "  ./install-nvim-plugins.sh         # Fedora plugins + plugins-config.lua"
echo "  ./install-vim-plugins.sh          # Same for Vim"
echo "  ./install-vim-lsp.sh              # vim-ale (does not overwrite ~/.vimrc)"
echo ""
echo "Flowchart (sibling): https://github.com/dsedgmen/devenv-code-flowchart"
echo "AI editor:           https://github.com/dsedgmen/devenv-ai-assistant"
