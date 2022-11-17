local lspconfig_loaded, masonlsp = pcall(require, 'mason-lspconfig')
if not lspconfig_loaded then
    print('Mason-lspconfig not loaded, try PackerInstall')
    return
end

local cmplsp_loaded, cmplsp = pcall(require, 'cmp_nvim_lsp')
if not cmplsp_loaded then
    print('Nvim-cmp-lsp not loaded')
    return
end
local capabilities = cmplsp.default_capabilities()

masonlsp.setup()
masonlsp.setup_handlers {
    function(server_name)
        require("lspconfig")[server_name].setup({capabilities = capabilities})
    end,

    ["sumneko_lua"] = function()
        require('lspconfig').sumneko_lua.setup({
            capabilities = capabilities,
            settings = {Lua = {library = {}, diagnostics = {globals = {'vim'}}}}
        })
    end
}

