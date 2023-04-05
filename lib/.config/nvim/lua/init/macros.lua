-- Change double quotes to single
vim.cmd([[let @s = "F\"r\'f\"r\'"]])

-- Change single quotes to double
vim.cmd([[let @d = "F\'r\"f\'r\"T{"]])

-- Break line after comma
vim.cmd([[let @h = "f,a\<CR>\<Esc>"]])
