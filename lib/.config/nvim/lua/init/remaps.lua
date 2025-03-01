local k = vim.keymap

-- SPACE as the leader key
vim.g.mapleader = " "

-- Splits nav
k.set("n", "<leader>j", "<C-W><C-j>")
k.set("n", "<leader>k", "<C-W><C-k>")
k.set("n", "<leader>l", "<C-W><C-l>")
k.set("n", "<leader>h", "<C-W><C-h>")

-- Splits create
k.set("n", "<leader>J", "<C-W>s<C-W><C-j>")
k.set("n", "<leader>K", "<C-W>s")
k.set("n", "<leader>L", "<C-W>v<C-W><C-l>")
k.set("n", "<leader>H", "<C-W>v")

-- Quit
k.set("n", "<leader>q", ":q<CR>")
k.set("n", "<C-q>", ":q<CR>")
k.set("n", "<leader>Q", ":qa<CR>")

-- Move highlighted lines up/down
k.set("v", "J", ":m '>+1<CR>gv=gv'")
k.set("v", "K", ":m '>-2<CR>gv=gv'")

-- Keep cursor in the middle
k.set("n", "J", "mzJ`z")
k.set("n", "<C-d>", "<C-d>zz")
k.set("n", "<C-u>", "<C-u>zz")
k.set("n", "n", "nzz")
k.set("n", "N", "Nzz")

-- Paste without loosing the currently yanked stuff
k.set("x", "<leader>p", "\"_dP")

-- Substitute the file on the cursor
k.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>//gI<Left><Left><Left>]])
k.set("n", "<leader>S", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Add/remove exec perms to the currently open file
k.set("n", "<leader>x", "<cmd>!chmod +x %<CR>")
k.set("n", "<leader>X", "<cmd>!chmod -x %<CR>")

-- Insert blank line below the cursor
k.set("n", "<CR>", "o<Esc>k")

-- Save all buffers
k.set("n", "\\", ":wa<CR>")

-- Close all buffers except the current one
vim.cmd([[command! BufOnly execute '%bdelete|edit #|normal `"''"`']])
k.set("n", "<leader>b", ":BufOnly<CR>")

-- Resize split to 60
k.set("n", "<leader>w", ":vertical resize 60<CR>")

-- Commands inserting text
k.set("n", "tt", ":put =strftime('__%Y-%m-%d %H:%M (%a)__')<CR>")
k.set("n", "tb", ":norm obinding.pry<CR>B")
k.set("n", "t5", ":norm o<%  %><CR>hhi")
k.set("n", "t%", ":norm o<%=  %><CR>hhi")
k.set("n", "tp", ":norm ofmt.Printf(\"%+v\\n\", )<CR>i")
k.set("n", "tl", ":norm ofmt.Println()<CR>i")
k.set("n", "tj", ":norm i{{ .T. }}<CR>hhi")
k.set("n", "ti", ":norm i{{ .I18n. }}<CR>hhi")

-- Remap the [ and ] to <Tab> and '
-- vim.keymap.set("n", "<Tab>d", vim.diagnostic.goto_prev)
-- vim.keymap.set("n", "'d", vim.diagnostic.goto_next)

-- Spell
-- vim.keymap.set("n", "<Tab>s", "[s")
-- vim.keymap.set("n", "'s", "[s")

-- Quickfixlist nav
k.set("n", "<C-k>", ":cprev<CR>")
k.set("n", "<C-j>", ":cnext<CR>")

function ConvertToPascalCase()
  -- Get the visual selection
  local _, line1, col1, _ = unpack(vim.fn.getpos("'<"))
  local _, line2, col2, _ = unpack(vim.fn.getpos("'>"))

  -- Extract the selected text
  local lines = vim.fn.getline(line1, line2)
  if #lines == 0 then return end

  -- If the selection is within a single line
  if #lines == 1 then
    lines[1] = string.sub(lines[1], col1, col2)
  else
    lines[1] = string.sub(lines[1], col1)
    lines[#lines] = string.sub(lines[#lines], 1, col2)
  end

  -- Concatenate lines and split into words
  local text = table.concat(lines, ' ')
  local words = vim.split(text, '%s+')

  -- Convert words to PascalCase
  for i, word in ipairs(words) do
    words[i] = string.upper(string.sub(word, 1, 1)) .. string.lower(string.sub(word, 2))
  end

  local pascalCase = table.concat(words, '')

  -- Substitute HereConvertedText with the actual function output
  local finalText = "{{ .I18n." .. pascalCase .. " }}"

  -- Replace the selected text with PascalCase and appended text
  if line1 == line2 then
    local currentLine = vim.fn.getline(line1)
    local newLine = string.sub(currentLine, 1, col1 - 1) .. finalText .. string.sub(currentLine, col2 + 1)
    vim.fn.setline(line1, newLine)
  else
    vim.fn.setline(line1, string.sub(vim.fn.getline(line1), 1, col1 - 1) .. finalText .. string.sub(vim.fn.getline(line2), col2 + 1))
    for i = line1 + 1, line2 do
      vim.fn.setline(i, "")
    end
  end
end

function Sum3LinesAbove()
  local current_line = vim.fn.line('.')
  local sum = 0

  for i = 1, 3 do
    local line_content = vim.fn.getline(current_line - i)
    local num_str = string.match(line_content, '%d+%.?%d*')
    if num_str then
      sum = sum + tonumber(num_str)
    end
  end

  vim.fn.setline(current_line, sum)
end

function SearchClass()
  local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
  local class_name

  for _, line in ipairs(lines) do
    class_name = line:match("class%s+([%w_:]+)") or line:match("RSpec.describe%s+([%w_:]+)")
    if class_name then break end
  end

  if class_name then
    vim.cmd("silent! Rg " .. vim.fn.escape(class_name, " "))
  else
    print("No class or RSpec describe found in this file.")
  end
end

vim.api.nvim_set_keymap('n', '<C-c>', ":lua SearchClass()<CR>", { noremap = true, silent = true })
