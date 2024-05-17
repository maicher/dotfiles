-- Packer is used as a package manager.
-- To install, follow guides on: https://github.com/wbthomason/packer.nvim

vim.cmd("packadd packer.nvim")

return require("packer").startup(function(use)
  use "wbthomason/packer.nvim"

  -- Theme
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons', opt = true }
  }
  use "navarasu/onedark.nvim"

  -- Browsing
  use "junegunn/fzf"
  use "junegunn/fzf.vim"
  use "airblade/vim-rooter"
  use "nvim-tree/nvim-tree.lua"
  use "ludovicchabant/vim-gutentags"
  use({
    "ThePrimeagen/harpoon",
    requires = "nvim-lua/plenary.nvim",
  })

  -- Git
  use "airblade/vim-gitgutter"
  use "tpope/vim-fugitive"

  -- Coding
  use "editorconfig/editorconfig-vim"
  use "mattn/vim-goimports"

-- DOT SKIP server
  use "nvim-treesitter/nvim-treesitter"
  use "nvim-treesitter/nvim-treesitter-textobjects"
  use "RRethy/nvim-treesitter-endwise"

  use({
    "VonHeikemen/lsp-zero.nvim",
    branch = "v2.x",
    requires = {
      { "neovim/nvim-lspconfig" },             -- Required
      {                                        -- Optional
        "williamboman/mason.nvim",
        run = function()
          pcall(vim.cmd, "MasonUpdate")
        end,
      },
      { "williamboman/mason-lspconfig.nvim" }, -- Optional

      -- Autocompletion
      { "hrsh7th/nvim-cmp" },     -- Required
      { "hrsh7th/cmp-nvim-lsp" }, -- Required
      { "hrsh7th/cmp-buffer" },
      { "hrsh7th/cmp-nvim-lua" },
      {'hrsh7th/cmp-path'},
      {'hrsh7th/cmp-cmdline'},

      -- Snippets
      {'L3MON4D3/LuaSnip'},
      {'saadparwaiz1/cmp_luasnip'},
      {'rafamadriz/friendly-snippets'},
    }
  })

  use("numToStr/Comment.nvim")
-- DOT END

  use "bronson/vim-trailing-whitespace"
  use "mbbill/undotree"          -- undo history visualizer
  use "vim-scripts/YankRing.vim" -- history of previous yanks, changes and deletes
end)
