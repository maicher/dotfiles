-- Mason setup
require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = {
    "ts_ls",
    "eslint",
    "cssls",
    "lua_ls",
    "solargraph",
    "gopls",
  },
  handlers = {
    function(server_name)
      require("lspconfig")[server_name].setup({
        capabilities = require("cmp_nvim_lsp").default_capabilities(),
      })
    end,
    cssls = function()
      require("lspconfig").cssls.setup({
        capabilities = require("cmp_nvim_lsp").default_capabilities(),
        filetypes = { "css", "scss", "sass" },
      })
    end,
  },
})

-- Completion
local cmp = require("cmp")

cmp.setup({
  sources = {
    { name = "path" },
    { name = "nvim_lsp" },
    { name = "nvim_lua" },
    { name = "buffer", keyword_length = 3, option = {
        get_bufnrs = function()
          return vim.api.nvim_list_bufs()
        end
      }
    },
  },
  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ["<C-j>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
    ["<C-k>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
    ["<Tab>"] = cmp.mapping.confirm({ select = true }),
  }),
  experimental = {
    ghost_text = true,
  },
})

-- Neovim 0.12 provides built-in LSP keymaps on attach:
--   gd  = definition       grn = rename        grr = references
--   gra = code action      gri = implementation  K = hover
--   [d / ]d = diagnostics  <C-S> = signature help (insert mode)
--
-- Below we add a few extras not covered by defaults.
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local opts = { buffer = args.buf }
    vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol, opts)
    vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, opts)
  end,
})
