local k = vim.keymap
local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

k.set("n", "<leader>M", mark.add_file)
k.set("n", "<leader>m", ui.toggle_quick_menu)

for i = 1, 9 do
  k.set("n", "<leader>" .. i, function() ui.nav_file(i) end)
end
