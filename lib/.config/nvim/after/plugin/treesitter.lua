-- DOT SKIP server

-- Parsers (new nvim-treesitter main branch API).
-- NOTE: the main branch is a full rewrite. `setup({ ensure_installed, auto_install })`
-- from the legacy master branch is silently ignored — parsers must be installed
-- via `require("nvim-treesitter").install(...)`. This call is async; on first run
-- parsers download in the background, then highlighting works on next open.
local parsers = {
  "bash",
  "c",
  "cmake",
  "gitignore",
  "go",
  "html",
  "javascript",
  "json",
  "lua",
  "php",
  "query",
  "ruby",
  "sql",
  "toml",
  "vim",
  "vimdoc",
  "vue",
}
require("nvim-treesitter").install(parsers)

-- Enable treesitter highlighting. The main branch no longer auto-attaches the
-- highlighter (the old `highlight = { enable = true }` is gone), so we start it
-- manually per buffer via FileType.
vim.api.nvim_create_autocmd("FileType", {
  pattern = parsers,
  callback = function(args)
    pcall(vim.treesitter.start, args.buf)
  end,
})

-- Disable treesitter highlighting for large files
vim.api.nvim_create_autocmd("BufReadPost", {
  callback = function(args)
    local max_filesize = 100 * 1024 -- 100 KB
    local ok, stats = pcall(vim.uv.fs_stat, vim.api.nvim_buf_get_name(args.buf))
    if ok and stats and stats.size > max_filesize then
      vim.treesitter.stop(args.buf)
    end
  end,
})

-- Textobject select keymaps (nvim-treesitter-textobjects)
local ts_select = require("nvim-treesitter-textobjects.select")
vim.keymap.set({ "x", "o" }, "am", function() ts_select.select_textobject("@function.outer") end)
vim.keymap.set({ "x", "o" }, "im", function() ts_select.select_textobject("@function.inner") end)
vim.keymap.set({ "x", "o" }, "ac", function() ts_select.select_textobject("@class.outer") end)
vim.keymap.set({ "x", "o" }, "ic", function() ts_select.select_textobject("@class.inner") end)
vim.keymap.set({ "x", "o" }, "as", function() ts_select.select_textobject("@scope", "locals") end)

-- Textobject move keymaps
local ts_move = require("nvim-treesitter-textobjects.move")
vim.keymap.set({ "n", "x", "o" }, "<C-l>", function() ts_move.goto_next_start("@function.outer") end)
vim.keymap.set({ "n", "x", "o" }, "]]", function() ts_move.goto_next_start("@class.outer") end)
vim.keymap.set({ "n", "x", "o" }, "][", function() ts_move.goto_next_end("@class.outer") end)
vim.keymap.set({ "n", "x", "o" }, "<C-h>", function() ts_move.goto_previous_start("@function.outer") end)
vim.keymap.set({ "n", "x", "o" }, "[[", function() ts_move.goto_previous_start("@class.outer") end)
vim.keymap.set({ "n", "x", "o" }, "[]", function() ts_move.goto_previous_end("@class.outer") end)
