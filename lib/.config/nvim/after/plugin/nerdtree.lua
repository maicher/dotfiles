vim.g.NERDTreeShowHidden = 1
vim.g.NERDTreeAutoDeleteBuffer = 1
vim.g.NERDTreeQuitOnOpen = 0
vim.g.NERDTreeWinSize = 60
vim.g.NERDTreeShowLineNumbers = 1

vim.keymap.set("n", "<leader>n", ":NERDTreeToggle<CR>")
vim.keymap.set("n", "<C-t>", ":NERDTreeFind<CR> z.")
