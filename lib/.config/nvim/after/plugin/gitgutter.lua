vim.g.gitgutter_enabled = 1
vim.g.gitgutter_async = 1
vim.g.gitgutter_map_keys = 0

vim.keymap.set("n", "[c", "<Plug>(GitGutterPrevHunk)")
vim.keymap.set("n", "]c", "<Plug>(GitGutterNextHunk)")

vim.cmd("highlight GitGutterAdd guifg=#98c379 ctermfg=Green")
vim.cmd("highlight GitGutterChange guifg=#d08c4d ctermfg=Yellow")
vim.cmd("highlight GitGutterDelete guifg=#dd535e ctermfg=Red")
