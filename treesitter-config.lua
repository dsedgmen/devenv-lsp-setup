-- Tree-sitter for Neovim — Fedora system grammars only (no TSUpdate).
-- Soft-required by devenv-ai-assistant.
-- Extra langs start only when the matching RPM parser is installed.

vim.opt.runtimepath:append("/usr/share/nvim/site")

local langs = {
  -- Core (install-lsp-treesitter.sh)
  "python",
  "bash",
  "c",
  "cpp",
  "go",
  "javascript",
  "typescript",
  "json",
  "yaml",
  "html",
  "css",
  "lua",
  "rust",
  "java",
  "ruby",
  -- Optional (install-treesitter-languages.sh)
  "c_sharp",
  "elixir",
  "heex",
  "php",
  "phpdoc",
  "jsdoc",
  "cmake",
  "toml",
}

for _, lang in ipairs(langs) do
  vim.api.nvim_create_autocmd("FileType", {
    pattern = lang,
    callback = function(ev)
      pcall(vim.treesitter.start, ev.buf, lang)
    end,
  })
end

if vim.fn.has("nvim-0.9") == 1 then
  vim.opt.foldmethod = "expr"
  vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
  vim.opt.foldenable = false
end
