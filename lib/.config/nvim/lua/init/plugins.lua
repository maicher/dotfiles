-- pckr is used as a package manager.
-- To install, follow guides on: https://github.com/lewis6991/pckr.nvim

local pckr_path = vim.fn.stdpath("data") .. "/pckr/pckr.nvim"

if not vim.uv.fs_stat(pckr_path) then
  vim.fn.system({
    "git", "clone", "https://github.com/lewis6991/pckr.nvim", pckr_path,
  })
end

vim.opt.rtp:prepend(pckr_path)

require("pckr").add{
  -- Theme
  { "nvim-lualine/lualine.nvim",
    requires = { "nvim-tree/nvim-web-devicons" },
  };
  "navarasu/onedark.nvim";

  -- Browsing
  "junegunn/fzf";
  "junegunn/fzf.vim";
  "airblade/vim-rooter";
  "nvim-tree/nvim-tree.lua";
  "ludovicchabant/vim-gutentags";
  { "ThePrimeagen/harpoon",
    requires = "nvim-lua/plenary.nvim",
  };

  -- Git
  "airblade/vim-gitgutter";
  "tpope/vim-fugitive";

  -- Coding
  "mattn/vim-goimports";

  { "windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup {} end,
  };
  { "windwp/nvim-ts-autotag",
    config = function() require("nvim-ts-autotag").setup {} end,
  };

-- DOT SKIP server
  { "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  };
  "nvim-treesitter/nvim-treesitter-textobjects";
  "RRethy/nvim-treesitter-endwise";

  -- LSP
  "neovim/nvim-lspconfig";
  { "williamboman/mason.nvim",
    run = function() pcall(vim.cmd, "MasonUpdate") end,
  };
  "williamboman/mason-lspconfig.nvim";

  -- Completion
  "hrsh7th/nvim-cmp";
  "hrsh7th/cmp-nvim-lsp";
  "hrsh7th/cmp-buffer";
  "hrsh7th/cmp-nvim-lua";
  "hrsh7th/cmp-path";
  "hrsh7th/cmp-cmdline";

  -- Snippets
  "L3MON4D3/LuaSnip";
  "saadparwaiz1/cmp_luasnip";
  "rafamadriz/friendly-snippets";

  "numToStr/Comment.nvim";
-- DOT END

  "bronson/vim-trailing-whitespace";
  "mbbill/undotree";
  "vim-scripts/YankRing.vim";
}
