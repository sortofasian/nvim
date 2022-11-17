local loaded, cmp = pcall(require, 'cmp')
if not loaded then
    print('Nvim-cmp not loaded')
    return
end

local luasnip_loaded, luasnip = pcall(require, 'luasnip')
if not luasnip_loaded then
    print('Luasnip not loaded')
    return
end

cmp.setup({
    snippet = {expand = function(args) luasnip.lsp_expand(args.body) end},
    window = {
        documentation = cmp.config.window.bordered(),
        completion = cmp.config
    },
    mapping = cmp.mapping.preset.insert({
        ['<Tab>'] = cmp.mapping.select_next_item(),
        ['<S-Tab>'] = cmp.mapping.select_prev_item(),
        ['<CR>'] = cmp.mapping.confirm({select = true}),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<Esc>'] = cmp.mapping.abort(),
    }),
    sources = cmp.config.sources({{name = 'nvim_lsp'}, {name = 'path'}})
})
