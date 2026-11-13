-- Optional Fedora vim-* plugins that work in Neovim.
-- Installed by install-nvim-plugins.sh; soft-required by devenv-ai-assistant.

-- NERDTree
vim.keymap.set("n", "<C-n>", ":NERDTreeToggle<CR>", { desc = "Toggle NERDTree" })
vim.g.NERDTreeShowHidden = 1
vim.g.NERDTreeIgnore = { "\\.pyc$", "\\~$", "\\.swp$", "\\.git$" }

-- CtrlP
vim.g.ctrlp_map = "<C-p>"
vim.g.ctrlp_cmd = "CtrlP"
vim.g.ctrlp_show_hidden = 1
vim.g.ctrlp_custom_ignore = {
  dir = "\\v[\\/](\\.(git|hg|svn)|node_modules|__pycache__)$",
  file = "\\v\\.(exe|so|dll|pyc)$",
}

-- GitGutter
vim.g.gitgutter_enabled = 1
vim.g.gitgutter_sign_added = "+"
vim.g.gitgutter_sign_modified = "~"
vim.g.gitgutter_sign_removed = "-"
vim.keymap.set("n", "]c", "<Plug>(GitGutterNextHunk)", { desc = "Next git change" })
vim.keymap.set("n", "[c", "<Plug>(GitGutterPrevHunk)", { desc = "Previous git change" })
vim.keymap.set("n", "<leader>hp", "<Plug>(GitGutterPreviewHunk)", { desc = "Preview hunk" })
vim.keymap.set("n", "<leader>hs", "<Plug>(GitGutterStageHunk)", { desc = "Stage hunk" })
vim.keymap.set("n", "<leader>hu", "<Plug>(GitGutterUndoHunk)", { desc = "Undo hunk" })

-- Fugitive
vim.keymap.set("n", "<leader>gs", ":Git status<CR>", { desc = "Git status" })
vim.keymap.set("n", "<leader>gc", ":Git commit<CR>", { desc = "Git commit" })
vim.keymap.set("n", "<leader>gp", ":Git push<CR>", { desc = "Git push" })
vim.keymap.set("n", "<leader>gl", ":Git log<CR>", { desc = "Git log" })
vim.keymap.set("n", "<leader>gb", ":Git blame<CR>", { desc = "Git blame" })
vim.keymap.set("n", "<leader>gd", ":Git diff<CR>", { desc = "Git diff" })

-- Trailing whitespace
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  command = "FixWhitespace",
})

-- Powerline
vim.opt.laststatus = 2
vim.g.Powerline_symbols = "unicode"
