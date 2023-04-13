-- Packer is used as a package manager.
-- To install, follow guides on: https://github.com/wbthomason/packer.nvim

vim.cmd("packadd packer.nvim")

return require("packer").startup(function(use)
  use "wbthomason/packer.nvim"

  -- Theme
  use "vim-airline/vim-airline"
  use "joshdick/onedark.vim"

  -- Browsing
  use "junegunn/fzf"
  use "junegunn/fzf.vim"
  use "airblade/vim-rooter"
  use "preservim/nerdtree"
  use "ryanoasis/vim-devicons"
  use "ludovicchabant/vim-gutentags"
  use "nvim-lua/plenary.nvim"
  use "ThePrimeagen/harpoon"

  -- Git
  use "airblade/vim-gitgutter"
  use "tpope/vim-fugitive"

  -- Coding
  use "sheerun/vim-polyglot"
  use "jiangmiao/auto-pairs"
  use "tpope/vim-endwise"        -- adds "end" in Ruby
  use "alvan/vim-closetag"
  use "editorconfig/editorconfig-vim"
  use "mattn/vim-goimports"

-- DOT SKIP server
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
      { "L3MON4D3/LuaSnip" },     -- Required
      { "hrsh7th/cmp-buffer" },
      { "hrsh7th/cmp-nvim-lua" },
    }
  })

  use("numToStr/Comment.nvim")
-- DOT END

  use "bronson/vim-trailing-whitespace"
  use "mbbill/undotree"          -- undo history visualizer
  use "vim-scripts/YankRing.vim" -- history of previous yanks, changes and deletes

  local lsp = require("lsp-zero")
  lsp.preset("recommended")

  lsp.ensure_installed({
    "tsserver",
    "eslint",
    "lua_ls",
    "solargraph",
    "gopls",
  })

  local cmp = require("cmp")

  cmp.setup({
    sources = {
      { name = "path" },
      { name = "nvim_lsp" },
      { name = "nvim_lua" },
      { name = "buffer", keyword_length = 5 },
    },
    experimental = {
      ghost_text = true,
    }
  })

  lsp.setup_nvim_cmp({
    mapping = lsp.defaults.cmp_mappings({
      ["<C-j>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
      ["<C-k>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
      ["<Tab>"] = cmp.mapping.confirm({ select = true }),
    })
  })

  lsp.setup()
end)
