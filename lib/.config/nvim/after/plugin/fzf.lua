vim.keymap.set("n", "<C-g>", ":Rg<CR>")
vim.keymap.set("n", "<C-f>", ":GFiles<CR>")
vim.keymap.set("n", "<leader>/", ":BLines<CR>")
vim.keymap.set("n", "<C-b>", ":Buffers<CR>")

-- Make fzf use bat with syntax highlighting for all files
vim.env.FZF_DEFAULT_OPTS = '--preview "bat --style=numbers --color=always --line-range :500 {}"'
