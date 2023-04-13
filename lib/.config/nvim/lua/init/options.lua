local o = vim.opt

o.encoding = "utf-8"
o.number = true
o.relativenumber = true
o.swapfile = false
o.backup = false
o.writebackup = false
o.undodir=os.getenv("USER_TMPDIR")
o.undofile = true
o.incsearch = true
o.background = "dark"
o.cursorline = true
o.list = true           -- show whitespace chars
o.colorcolumn = "80"
o.cmdheight = 2
o.updatetime = 1000
o.shortmess:append "c"
o.signcolumn = "yes"
o.compatible = false
o.termguicolors = true
o.ttimeoutlen = 100
o.wrap = false
o.ma = true
o.autoindent = true
o.tabstop = 4
o.shiftwidth = 4
o.smarttab = true
o.showmode = false
o.smartcase = true
o.ignorecase = true
o.showtabline = 2

-- DOT SKIP server
o.spell = true
o.spelllang = "en_us,pl"
-- DOT END

vim.api.nvim_create_augroup("ft", { clear = true })
vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "*erubis",
  command = "set syntax=html",
  group = "ft"
})
vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "*vue",
  command = "set syntax=javascript",
  group = "ft"
})
