local loaded, cmp = pcall(require, 'cmp')
if not loaded then
    print('Nvim-cmp not loaded')
    return
end

cmp.setup({
    snippet = {},
    window = {documentation = cmp.config.window.bordered()},
    mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<Esc>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({select = true})
    }),
    sources = cmp.config.sources({{name = 'nvim_lsp'}, {name = 'path'}})
})
