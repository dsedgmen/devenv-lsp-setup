" ALE/LSP for Vim (devenv-lsp-setup).
" Sourced via ~/.vim/plugin/devenv-lsp-ale.vim — does not replace ~/.vimrc.
" AI keymaps: devenv-ai-assistant.

let g:ale_enabled = 1

let g:ale_linters = {
\   'python': ['pylsp', 'ruff'],
\   'go': ['gopls'],
\   'javascript': ['eslint'],
\   'typescript': ['eslint', 'tsserver'],
\   'bash': ['shellcheck', 'bash-language-server'],
\   'sh': ['shellcheck', 'bash-language-server'],
\}

let g:ale_fixters = {
\   'python': ['black', 'isort'],
\   'go': ['gofmt'],
\   'javascript': ['prettier'],
\   'typescript': ['prettier'],
\}

let g:ale_fix_on_save = 1
let g:ale_completion_enabled = 1
let g:ale_completion_autoimport = 1
let g:ale_sign_error = 'E'
let g:ale_sign_warning = 'W'
let g:ale_echo_msg_format = '[%linter%] %s'

nmap gd <Plug>(ale_go_to_definition)
nmap gD <Plug>(ale_go_to_type_definition)
nmap gr <Plug>(ale_find_references)
nmap K <Plug>(ale_hover)
nmap <leader>rn <Plug>(ale_rename)
nmap <leader>ca <Plug>(ale_code_action)
nmap [d <Plug>(ale_previous_wrap)
nmap ]d <Plug>(ale_next_wrap)
nmap <leader>e <Plug>(ale_detail)

inoremap <C-Space> <C-x><C-o>
