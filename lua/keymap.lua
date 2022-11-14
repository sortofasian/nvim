local map = vim.keymap.set
local let = vim.g

let.mapleader = " "

map('i', '<C-c>', '<ESC>', {noremap = true, silent = true})
map('n', '<C-c>', '<ESC>', {noremap = true, silent = true})
map('n', 's', ':w<CR>', {noremap = true, silent = true})

map('n', '<Leader>t', ':vne<CR>:terminal<CR>i', {noremap = true, silent = true})
map('t', '<Leader>T', '<C-\\><C-n>:q<CR>', {noremap = true, silent = true})
map('t', '<Leader><C-t>', '<C-\\><C-n>', {noremap = true, silent = true})

vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if client.server_capabilities.hoverProvider then
            map('n', '<Leader>h', function()
                vim.lsp.buf.hover()
                vim.lsp.buf.hover()
            end, {noremap = true, silent = true, buffer = args.buf})
        end
    end
})
