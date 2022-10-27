local loaded, mason = pcall(require, 'mason')
if not loaded then
    print('Mason not loaded, try PackerInstall')
    return
end

mason.setup()
