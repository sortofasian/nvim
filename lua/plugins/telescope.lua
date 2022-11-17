local loaded, telescope = pcall(require, 'telescope')
if not loaded then
    print('Telescope not loaded')
    return
end

local actions = require('telescope.actions')
local builtin = require('telescope.builtin')
local fb = telescope.extensions.file_browser
local map = vim.keymap.set

telescope.setup({
    defaults = {
        mappings = {
            ['i'] = {['<C-c>'] = false, ['<CR>'] = function() vim.cmd('stopinsert') end},
            ['n'] = {["q"] = actions.close, ['s'] = actions.toggle_selection}
        },
        initial_mode = 'normal'
    },
    extensions = {
        fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = "smart_case"
        },
        file_browser = {
            hijack_netrw = false,
            mappings = {
                ["n"] = {
                    ['<Leader>f'] = actions.close,
                    ['c'] = fb.actions.create,
                    ['d'] = fb.actions.copy,
                    ['m'] = fb.actions.move,
                    ['r'] = fb.actions.rename,
                    ['x'] = fb.actions.remove,
                    ['h'] = fb.actions.toggle_hidden,
                    ['b'] = fb.actions.goto_parent_dir,
                    ['<Leader>cd'] = fb.actions.change_cwd
                }
            }
        }
    }
})
telescope.load_extension "fzf"
telescope.load_extension "file_browser"

map('n', '<Leader>ef', builtin.diagnostics)
map('n', '<Leader>gs', builtin.git_status)
map('n', '<Leader>gc', builtin.git_commits)
map('n', '<Leader>gb', builtin.git_branches)
map('n', '<Leader>gh', builtin.git_stash)
map('n', '<Leader>e', function() builtin.diagnostics() end)
map('n', '<Leader>f', function()
    fb.file_browser({
        grouped = true,
        path = '%:p:h',
        cwd = vim.fn.expand('%:p:h'),
        respect_gitignore = false
    })
end)
