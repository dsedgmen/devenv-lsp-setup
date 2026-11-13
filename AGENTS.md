# Agent guide — devenv-lsp-setup

## Purpose

Host Neovim/Vim **LSP + Tree-sitter** configs and Fedora plugin installers.

Flowchart: [devenv-code-flowchart](https://github.com/dsedgmen/devenv-code-flowchart).  
AI keymaps/CLI and packaging are other siblings — do not re-vendor them here.

## Layout

| Path | Role |
|------|------|
| `lsp-config.lua` | Neovim LSP (Fedora servers) |
| `treesitter-config.lua` | Neovim Tree-sitter (system grammars) |
| `plugins-config.lua` | Optional Neovim plugin maps |
| `vim-ale-config.vim` | Vim ALE maps (installed under `~/.vim/plugin/`) |
| `install*.sh` | Fedora `dnf` installers |

## Constraints

1. Fedora RPMs only for servers/grammars/plugins — no mason/npm.
2. Stable install paths: `~/.config/nvim/lua/{lsp-config,treesitter-config,plugins-config}.lua`.
3. `install-vim-lsp.sh` must not overwrite `~/.vimrc`.
4. No secrets in git.

## Packaging

Mirror devenv-ai-helper: `VERSION`, `scripts/rpm-version.sh`, `.copr/Makefile`,
`.packit.yaml`, `rpm.yml` / `security.yml` / `release.yml`. Spec macros
`devenv_lsp_ver` / `devenv_lsp_rel`. Separate RPMs:
`devenv-lsp-setup`, `devenv-lsp-setup-neovim`, `devenv-lsp-setup-vim`.

## Verify

- `bash -n install.sh install-*.sh`
- `luac -p` / load under nvim when available
- `./scripts/rpm-version.sh --shell`

Ask before: releases, force-push, skipping hooks.
