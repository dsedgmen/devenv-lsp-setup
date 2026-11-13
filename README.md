# devenv-lsp-setup

[![RPM](https://github.com/dsedgmen/devenv-lsp-setup/actions/workflows/rpm.yml/badge.svg)](https://github.com/dsedgmen/devenv-lsp-setup/actions/workflows/rpm.yml)
[![Security](https://github.com/dsedgmen/devenv-lsp-setup/actions/workflows/security.yml/badge.svg)](https://github.com/dsedgmen/devenv-lsp-setup/actions/workflows/security.yml)
[![Release](https://github.com/dsedgmen/devenv-lsp-setup/actions/workflows/release.yml/badge.svg)](https://github.com/dsedgmen/devenv-lsp-setup/actions/workflows/release.yml)
[![COPR](https://copr.fedorainfracloud.org/coprs/dsedgmen/devenv/package/devenv-lsp-setup/status_image/last_build.png)](https://copr.fedorainfracloud.org/coprs/dsedgmen/devenv/package/devenv-lsp-setup/)
[![GitHub release](https://img.shields.io/github/v/release/dsedgmen/devenv-lsp-setup?include_prereleases)](https://github.com/dsedgmen/devenv-lsp-setup/releases)

Fedora-friendly **LSP**, **Tree-sitter**, and productivity plugin configs for
Vim/Neovim.

| Sibling | Role |
|---------|------|
| [devenv-ai-assistant](https://github.com/dsedgmen/devenv-ai-assistant) | AI keymaps (soft-requires these modules) |
| [devenv-code-flowchart](https://github.com/dsedgmen/devenv-code-flowchart) | Offline Mermaid/ASCII call-graph |
| [devenv-ai-helper](https://github.com/dsedgmen/devenv-ai-helper) | AI CLI |
| [devenv-packager](https://github.com/dsedgmen/devenv-packager) | Stages this repo into images |
| [devenv](https://github.com/dsedgmen/devenv) | `DEVENV_LSP_SETUP_DIR` discovery |

## Install (Fedora COPR)

Separate Neovim and Vim RPMs (shared data package pulled in automatically):

```bash
sudo dnf copr enable dsedgmen/devenv
sudo dnf install devenv-lsp-setup-neovim   # packpath Lua modules
sudo dnf install devenv-lsp-setup-vim      # vimfiles ALE config
```

## Quick start (from git)

```bash
git clone https://github.com/dsedgmen/devenv-lsp-setup.git
cd devenv-lsp-setup
./install.sh
./install-lsp-treesitter.sh   # Fedora LSP + grammars (sudo dnf)
./install-nvim-plugins.sh     # optional Fedora plugins
```

`install.sh` installs:

- `~/.config/nvim/lua/lsp-config.lua`
- `~/.config/nvim/lua/treesitter-config.lua`

## Installers

| Script | Purpose |
|--------|---------|
| `install.sh` | Copy LSP + Treesitter Lua modules |
| `install-lsp-treesitter.sh` | LSP servers + core Tree-sitter grammars |
| `install-treesitter-languages.sh` | Extra language RPMs (`--all` / LANG / `--list`) |
| `install-nvim-plugins.sh` | Fedora plugins + `plugins-config.lua` |
| `install-vim-plugins.sh` | Same plugins; appends once to `~/.vimrc` |
| `install-vim-lsp.sh` | `vim-ale` under `~/.vim/plugin/` (does not overwrite `~/.vimrc`) |

## Discovery

Set `DEVENV_LSP_SETUP_DIR`, or clone as sibling `../devenv-lsp-setup`.

Versioning / COPR / tags: [RELEASE.md](RELEASE.md). Agent guidance: [AGENTS.md](AGENTS.md).
