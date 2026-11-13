# devenv-lsp-setup

Fedora-friendly **LSP**, **Tree-sitter**, and productivity plugin configs for
Vim/Neovim.

| Sibling | Role |
|---------|------|
| [devenv-ai-assistant](https://github.com/dsedgmen/devenv-ai-assistant) | AI keymaps (soft-requires these modules) |
| [devenv-code-flowchart](https://github.com/dsedgmen/devenv-code-flowchart) | Offline Mermaid/ASCII call-graph |
| [devenv-ai-helper](https://github.com/dsedgmen/devenv-ai-helper) | AI CLI |
| [devenv-packager](https://github.com/dsedgmen/devenv-packager) | Stages this repo into images |
| [devenv](https://github.com/dsedgmen/devenv) | `DEVENV_LSP_SETUP_DIR` discovery |

## Quick start

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

Agent guidance: [AGENTS.md](AGENTS.md).
