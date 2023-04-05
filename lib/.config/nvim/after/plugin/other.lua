-- closetag
vim.g.closetag_filenames = '*.html*'

-- undotree
vim.keymap.set("n", "<leader>u", ":UndotreeToggle<CR>")

-- YankRing
vim.g.yankring_paste_using_g = 0
vim.g.yankring_history_dir = os.getenv("USER_TMPDIR")

vim.keymap.set("n", "<leader>p", ":YRShow<CR>")

-- gutentags
vim.cmd("set statusline+=%{gutentags#statusline()}")

-- fugitive
vim.keymap.set("n", "gb", ":Git blame<CR>")
