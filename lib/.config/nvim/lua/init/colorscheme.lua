vim.cmd("color onedark")

-- Make comments and line numbers a little bit brighter
vim.api.nvim_set_hl(0, "Comment", { fg = "#687285" })
vim.api.nvim_set_hl(0, "LineNr", { fg = "#687285" })

-- Apply transparent background
vim.api.nvim_create_augroup("xx", { clear = true })
vim.api.nvim_create_autocmd("BufEnter", {
  command = 'call onedark#set_highlight("Normal", { "fg": { "gui": "#ABB2BF", "cterm": "145", "cterm16" : "7" } })',
  group = "xx"
})
