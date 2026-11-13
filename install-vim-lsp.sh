#!/usr/bin/env bash
# Install vim-ale + ALE config without overwriting ~/.vimrc.

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "Installing vim-ale..."
sudo dnf install -y vim-ale

mkdir -p ~/.vim/plugin
cp "$SCRIPT_DIR/vim-ale-config.vim" ~/.vim/plugin/devenv-lsp-ale.vim
echo "Installed ~/.vim/plugin/devenv-lsp-ale.vim (auto-sourced by Vim)"

need=()
command -v pylsp >/dev/null 2>&1 || need+=(python3-lsp-server)
command -v gopls >/dev/null 2>&1 || need+=(gopls)
command -v bash-language-server >/dev/null 2>&1 || need+=(nodejs-bash-language-server)
if [ "${#need[@]}" -gt 0 ]; then
  echo "Installing missing LSP servers: ${need[*]}"
  sudo dnf install -y "${need[@]}"
fi

echo ""
echo "Done. Maps: gd gr K <leader>rn [d ]d <C-Space>"
echo "AI keymaps: install devenv-ai-assistant separately (does not conflict)."
