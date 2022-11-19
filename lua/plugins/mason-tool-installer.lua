local loaded, mti = pcall(require, 'mason-tool-installer')
if not loaded then
    print('Mason Tool Installer missing')
    return
end

mti.setup(
{
    ensure_installed = {
    -- Lua
    "lua-language-server",
    "luaformatter",

    -- Web
    "typescript-language-server",
    "prisma-language-server",
    "css-lsp",
    "eslint-lsp",
    "prettier",
    --"rome",

    -- Python
    "autopep8",
    "pyright",
    "python-lsp-server",

    -- Rust
    "rust-analyzer",

    -- Json
    "json-lsp",
    "fixjson",

    "dockerfile-language-server"
    },
    auto_update = true,
    run_on_start = true
})
