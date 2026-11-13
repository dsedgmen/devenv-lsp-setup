#!/usr/bin/env bash
# Install extra Tree-sitter language RPMs (Fedora).
# treesitter-config.lua already lists optional langs; pcall-starts when present.

set -euo pipefail

EXTRA=(
  tree-sitter-c-sharp
  tree-sitter-elixir
  tree-sitter-heex
  tree-sitter-php
  tree-sitter-phpdoc
  tree-sitter-jsdoc
  tree-sitter-cmake
  tree-sitter-toml
)

usage() {
  echo "Usage: $0 [--all | --list | LANG...]"
  echo "  --all     install all extra language packages"
  echo "  --list    show installed tree-sitter-* RPMs"
  echo "  LANG...   c-sharp elixir heex php phpdoc jsdoc cmake toml"
}

if [ "${1:-}" = "--list" ]; then
  rpm -qa 'tree-sitter-*' | grep -vE 'cli|macros' | sort || true
  exit 0
fi

if [ "${1:-}" = "-h" ] || [ "${1:-}" = "--help" ]; then
  usage
  exit 0
fi

if [ "${1:-}" = "--all" ] || [ $# -eq 0 ]; then
  if [ $# -eq 0 ]; then
    echo "No args: installing all extras. Pass --list or LANG names to narrow."
  fi
  sudo dnf install -y "${EXTRA[@]}"
  echo "Done. Re-open Neovim."
  exit 0
fi

pkgs=()
for lang in "$@"; do
  case "$lang" in
    c-sharp|csharp) pkgs+=(tree-sitter-c-sharp) ;;
    elixir) pkgs+=(tree-sitter-elixir) ;;
    heex) pkgs+=(tree-sitter-heex) ;;
    php) pkgs+=(tree-sitter-php) ;;
    phpdoc) pkgs+=(tree-sitter-phpdoc) ;;
    jsdoc) pkgs+=(tree-sitter-jsdoc) ;;
    cmake) pkgs+=(tree-sitter-cmake) ;;
    toml) pkgs+=(tree-sitter-toml) ;;
    *) echo "Unknown language: $lang" >&2; usage; exit 1 ;;
  esac
done

sudo dnf install -y "${pkgs[@]}"
echo "Done. Re-open Neovim."
