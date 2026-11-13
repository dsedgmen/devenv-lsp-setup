-- LSP for Neovim — Fedora system servers only (no mason/npm).
-- Soft-required by devenv-ai-assistant.

local function root_dir(markers)
  local found = vim.fs.find(markers, { upward = true })[1]
  if found then
    return vim.fs.dirname(found)
  end
  return vim.fn.getcwd()
end

local function on_attach(client, bufnr)
  local opts = { buffer = bufnr, noremap = true, silent = true }
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
  vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
  vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
  vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
  vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
  vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
  vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
  vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
  vim.keymap.set("n", "<leader>f", function()
    vim.lsp.buf.format({ async = true })
  end, opts)
  vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
  vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
  vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, opts)
  vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, opts)
end

local function start_if_available(ft_patterns, opts)
  vim.api.nvim_create_autocmd("FileType", {
    pattern = ft_patterns,
    callback = function()
      if vim.fn.executable(opts.cmd[1]) ~= 1 then
        return
      end
      opts.root_dir = opts.root_dir or root_dir(opts.markers or { ".git" })
      opts.on_attach = on_attach
      vim.lsp.start(opts)
    end,
  })
end

start_if_available("python", {
  name = "pylsp",
  cmd = { "pylsp" },
  markers = { ".git", "setup.py", "pyproject.toml", "requirements.txt" },
  settings = {
    pylsp = {
      plugins = {
        pycodestyle = { enabled = true },
        pyflakes = { enabled = true },
        pylint = { enabled = false },
        ruff = { enabled = true },
        black = { enabled = true },
      },
    },
  },
})

start_if_available("go", {
  name = "gopls",
  cmd = { "gopls" },
  markers = { "go.mod", ".git" },
})

start_if_available({ "sh", "bash" }, {
  name = "bashls",
  cmd = { "bash-language-server", "start" },
  markers = { ".git" },
})

vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  update_in_insert = false,
  underline = true,
  severity_sort = true,
  float = {
    border = "rounded",
    source = "always",
    header = "",
    prefix = "",
  },
})

vim.opt.completeopt = { "menu", "menuone", "noselect" }
vim.keymap.set("i", "<C-Space>", "<C-x><C-o>", { noremap = true })
