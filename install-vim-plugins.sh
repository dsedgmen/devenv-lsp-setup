#!/usr/bin/env bash
# Install Fedora vim plugins and append config block to ~/.vimrc once.

set -euo pipefail

echo "Installing Vim plugins from Fedora..."
sudo dnf install -y \
  vim-fugitive \
  vim-gitgutter \
  vim-nerdtree \
  vim-ctrlp \
  vim-commentary \
  vim-rhubarb \
  vim-trailing-whitespace \
  vim-powerline

MARKER="Plugin Configuration (devenv-lsp-setup)"
if [ -f ~/.vimrc ] && grep -qF "$MARKER" ~/.vimrc 2>/dev/null; then
  echo "Plugin block already present in ~/.vimrc"
  exit 0
fi

if [ -f ~/.vimrc ]; then
  cp ~/.vimrc ~/.vimrc.backup."$(date +%Y%m%d_%H%M%S)"
fi

cat >> ~/.vimrc << 'EOF'

" Plugin Configuration (devenv-lsp-setup)
nnoremap <C-n> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1
let NERDTreeIgnore=['\.pyc$', '\~$', '\.swp$', '\.git$']

let g:ctrlp_map = '<C-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_show_hidden = 1
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.(git|hg|svn)|node_modules|__pycache__)$',
  \ 'file': '\v\.(exe|so|dll|pyc)$',
  \ }

let g:gitgutter_enabled = 1
nmap ]c <Plug>(GitGutterNextHunk)
nmap [c <Plug>(GitGutterPrevHunk)
nmap <leader>hp <Plug>(GitGutterPreviewHunk)
nmap <leader>hs <Plug>(GitGutterStageHunk)
nmap <leader>hu <Plug>(GitGutterUndoHunk)

nnoremap <leader>gs :Git status<CR>
nnoremap <leader>gc :Git commit<CR>
nnoremap <leader>gp :Git push<CR>
nnoremap <leader>gl :Git log<CR>
nnoremap <leader>gb :Git blame<CR>
nnoremap <leader>gd :Git diff<CR>

autocmd BufWritePre * :FixWhitespace
set laststatus=2
let g:Powerline_symbols = 'unicode'
EOF

echo "Appended plugin block to ~/.vimrc"
echo "Maps: <C-n> NERDTree | <C-p> CtrlP | <leader>gs Git | ]c/[c hunks | gcc comment"
