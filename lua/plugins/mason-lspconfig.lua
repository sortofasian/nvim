local loaded, masonlsp = pcall(require, 'mason-lspconfig')
if not loaded then
    print('Mason-lspconfig not loaded, try PackerInstall')
    return
end

local loaded, cmplsp = pcall(require, 'cmp_nvim_lsp')
if not loaded then
    print('Nvim-cmp-lsp not loaded')
    return
end
local capabilities = require('cmp_nvim_lsp').default_capabilities()

masonlsp.setup()
masonlsp.setup_handlers {
    function(server_name)
        require("lspconfig")[server_name].setup(
            {capabilities=capabilities})
    end,

    ["sumneko_lua"] = function()
        require('lspconfig').sumneko_lua.setup(
            {
                capabilities = capabilities,
                settings = {
                    Lua = {library = {}, diagnostics = {globals = {'vim'}}}
                }
            })
    end
}

