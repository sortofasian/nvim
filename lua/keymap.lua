local map = vim.api.nvim_set_keymap
local options = {
    noremap = true,
    silent = true
}

map('i', '<C-c>', '<ESC>', options)
map('n', 's', ':w<CR>', options)

map('n', 't', ':vne<CR>:terminal<CR>i', options)
map('t', '<C-t>', '<C-\\><C-n>:q<CR>', options)

