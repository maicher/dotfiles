local lsp = require("lsp-zero")
lsp.preset("recommended")

-- Mason setup
require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = {
    "typescript-language-server",
    "eslint",
    "cssls",
    "lua_ls",
    "solargraph",
    "gopls",
  },
})

lsp.ensure_installed({
  "ts_ls",
  "eslint",
  "cssls",
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
    { name = "buffer", keyword_length = 3, option = {
        get_bufnrs = function ()
          return vim.api.nvim_list_bufs() -- Autocomplete from all buffers (not only the current)
        end
      }
    },
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

lsp.setup()

-- Add this after lsp.setup()
local lspconfig = require("lspconfig")

lspconfig.cssls.setup({
  filetypes = { "css", "scss", "sass" }
})
