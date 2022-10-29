local packer_exists = pcall(vim.cmd, [[packadd packer.nvim]])
local packer_bootstrapped = false

if not packer_exists then
    local packer_repo = 'https://github.com/wbthomason/packer.nvim'
    local install_dir = vim.fn.stdpath('data') ..
                            '/site/pack/packer/start/packer.nvim'

    if vim.fn.input('Install Packer ? ') ~= 'y' then return end
    print(' ')
    packer_bootstrapped = true

    vim.fn.mkdir(install_dir, 'p')
    print(vim.fn.system('git clone --depth 1 ' .. packer_repo .. ' ' ..
                            install_dir))
    vim.cmd([[packadd packer.nvim]])
    return
end

return require('packer').startup(function(use)
    use('wbthomason/packer.nvim')
    ---------------------------

    ------- tokyo night -------
    use {
        'folke/tokyonight.nvim',
        config = function() require('plugins/tokyonight') end
    }

    ---------- alpha ----------
    use {'goolord/alpha-nvim', config = function() require('plugins/alpha') end}

    ---------- mason ----------
    use {
        'williamboman/mason.nvim',
        config = function() require('plugins/mason') end
    }

    ----- mason lspconfig -----
    use {
        'williamboman/mason-lspconfig.nvim',
        config = function() require('plugins/mason-lspconfig') end
    }

    -------- lspconfig --------
    use {'neovim/nvim-lspconfig'}

    -------- neoformat --------
    use {'sbdchd/neoformat'}

    -------- gitsigns ---------
    use {
        'lewis6991/gitsigns.nvim',
        config = function() require('plugins/gitsigns') end
    }

    -------- nvim-cmp ---------
    use {'hrsh7th/cmp-nvim-lsp'}
    use {'hrsh7th/cmp-path'}
    use {'hrsh7th/nvim-cmp', config = function() require('plugins/cmp') end}

    ---------------------------
    if packer_bootstrapped then require('packer').sync() end
end)

