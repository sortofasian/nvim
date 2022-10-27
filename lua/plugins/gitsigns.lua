local loaded, gitsigns = pcall(require, 'gitsigns')
if not loaded then
    print('Gitsigns not loaded')
    return
end

gitsigns.setup{
    signcolumn = true
}
