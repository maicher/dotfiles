local k = vim.keymap

-- SPACE as the leader key
vim.g.mapleader = " "

-- Quickfixlist nav
k.set("n", "<C-j>", ":cn<CR>")
k.set("n", "<C-k>", ":cp<CR>")

-- Splits nav
k.set("n", "<leader>j", "<C-W><C-j>")
k.set("n", "<leader>k", "<C-W><C-k>")
k.set("n", "<leader>l", "<C-W><C-l>")
k.set("n", "<leader>h", "<C-W><C-h>")

-- Splits create
k.set("n", "<leader>J", "<C-W>s<C-W><C-j>")
k.set("n", "<leader>K", "<C-W>s")
k.set("n", "<leader>L", "<C-W>v<C-W><C-l>")
k.set("n", "<leader>H", "<C-W>v")

-- Quit
k.set("n", "<leader>q", ":q<CR>")
k.set("n", "<C-q>", ":q<CR>")
k.set("n", "<leader>Q", ":qa<CR>")

-- Move highlighted lines up/down
k.set("v", "J", ":m '>+1<CR>gv=gv'")
k.set("v", "K", ":m '>-2<CR>gv=gv'")

-- Keep cursor in the middle
k.set("n", "J", "mzJ`z")
k.set("n", "<C-d>", "<C-d>zz")
k.set("n", "<C-u>", "<C-u>zz")
k.set("n", "n", "nzzzv")
k.set("n", "N", "Nzzzv")

-- Paste without loosing the currently yanked stuff
k.set("x", "<leader>p", "\"_dP")

-- Substitute the file on the cursor
k.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Add/remove exec perms to the currently open file
k.set("n", "<leader>x", "<cmd>!chmod +x %<CR>")
k.set("n", "<leader>X", "<cmd>!chmod -x %<CR>")

-- Insert blank line below the cursor
k.set("n", "<CR>", "o<Esc>k")

-- Save all buffers
k.set("n", "\\", ":wa<CR>")

-- Close all buffers except the current one
vim.cmd([[command! BufOnly execute '%bdelete|edit #|normal `"''"`']])
k.set("n", "<leader>b", ":BufOnly<CR>")

-- Resize split to 60
k.set("n", "<leader>w", ":vertical resize 60<CR>")

-- Commands inserting text
k.set("n", "tt", ":put =strftime('__%Y-%m-%d %H:%M (%a)__')<CR>")
k.set("n", "tb", ":norm obinding.pry<CR>B")
k.set("n", "t5", ":norm i<%  %><CR>hhi")
k.set("n", "t%", ":norm i<%=  %><CR>hhi")
k.set("n", "tp", ":norm ofmt.Printf(\"%+v\\n\", )<CR>i")
