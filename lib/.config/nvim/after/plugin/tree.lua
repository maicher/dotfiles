-- vim.g.NERDTreeShowHidden = 1
-- vim.g.NERDTreeAutoDeleteBuffer = 1
-- vim.g.NERDTreeQuitOnOpen = 0
-- vim.g.NERDTreeWinSize = 60
-- vim.g.NERDTreeShowLineNumbers = 1
--
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- empty setup using defaults
require("nvim-tree").setup({
  actions = {
    open_file = {
      window_picker = {
        enable = false,
      },
    },
  },
  renderer = {
    icons = {
      show = {
        file = false,
        folder = false,
        folder_arrow = true,
        git = false,
      }
    },
  },
  git = {
    enable = false,
  },
  view = {
    width = 60,
    number = true,
    relativenumber = true,
  },
})

vim.keymap.set("n", "<leader>n", ":NvimTreeToggle<CR>")
vim.keymap.set("n", "<leader>t", ":NvimTreeFindFile<CR>zz")
