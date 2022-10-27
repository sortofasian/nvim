local loaded, tokyonight = pcall(require, 'tokyonight')
if not loaded then
    print('Tokyonight not loaded, try PackerInstall')
    return
end

tokyonight.setup({
    style = 'moon'
})

vim.cmd[[colorscheme tokyonight]]
