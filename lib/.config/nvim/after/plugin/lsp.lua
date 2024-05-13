local lsp = require("lsp-zero")
lsp.preset("recommended")

lsp.ensure_installed({
  "tsserver",
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
    { name = "buffer", keyword_length = 4 },
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
