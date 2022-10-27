local loaded, masonlsp = pcall(require, 'mason-lspconfig')
if not loaded then
    print('Mason-lspconfig not loaded, try PackerInstall')
    return
end
coq = require('coq')

masonlsp.setup()
masonlsp.setup_handlers {
    function(server_name)
        require("lspconfig")[server_name].setup(
            coq.lsp_ensure_capabilities({}))
    end,

    ["sumneko_lua"] = function()
        require('lspconfig').sumneko_lua.setup(
            require('coq').lsp_ensure_capabilities({
                settings = {
                    Lua = {library = {}, diagnostics = {globals = {'vim'}}}
                }
            }))
    end
}

