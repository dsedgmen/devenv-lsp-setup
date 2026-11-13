#!/usr/bin/env bash
# Install LSP servers and Tree-sitter grammars from Fedora repos only.

set -euo pipefail

LSP_SERVERS=(
  python3-lsp-server
  python3-lsp-ruff
  python3-lsp-black
  gopls
  nodejs-bash-language-server
)

TREESITTER_CORE=(
  libtree-sitter
  tree-sitter-cli
)

TREESITTER_GRAMMARS=(
  libtree-sitter-python
  libtree-sitter-bash
  libtree-sitter-c
  libtree-sitter-cpp
  libtree-sitter-go
  libtree-sitter-javascript
  libtree-sitter-typescript
  libtree-sitter-json
  libtree-sitter-yaml
  libtree-sitter-html
  libtree-sitter-css
  libtree-sitter-lua
  libtree-sitter-rust
  libtree-sitter-java
  libtree-sitter-ruby
)

echo "Installing LSP servers..."
sudo dnf install -y "${LSP_SERVERS[@]}"

echo "Installing Tree-sitter core..."
sudo dnf install -y "${TREESITTER_CORE[@]}"

echo "Installing Tree-sitter grammars (${#TREESITTER_GRAMMARS[@]})..."
sudo dnf install -y "${TREESITTER_GRAMMARS[@]}"

echo ""
echo "Done. Verify with: pylsp --help | gopls version | bash-language-server --version | tree-sitter --version"
echo "Then: ./install.sh  # if Lua modules are not installed yet"
