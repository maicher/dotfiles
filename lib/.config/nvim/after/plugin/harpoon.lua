local k = vim.keymap
local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

k.set("n", "<leader>M", mark.add_file)
k.set("n", "<leader>m", ui.toggle_quick_menu)

k.set("n", "<leader>1", function() ui.nav_file(1) end)
k.set("n", "<leader>2", function() ui.nav_file(2) end)
k.set("n", "<leader>3", function() ui.nav_file(3) end)
k.set("n", "<leader>4", function() ui.nav_file(4) end)
k.set("n", "<leader>5", function() ui.nav_file(5) end)
k.set("n", "<leader>6", function() ui.nav_file(6) end)
k.set("n", "<leader>7", function() ui.nav_file(7) end)
k.set("n", "<leader>8", function() ui.nav_file(8) end)
k.set("n", "<leader>9", function() ui.nav_file(9) end)
k.set("n", "<leader>0", function() ui.nav_file(0) end)
