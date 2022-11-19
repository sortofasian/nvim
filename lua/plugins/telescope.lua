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
            ['i'] = {
                ['<C-c>'] = false,
                ['<CR>'] = function() vim.cmd('stopinsert') end
            },
            ['n'] = {
                ['q'] = actions.close,
                ['s'] = actions.toggle_selection,
                ['H<CR>'] = actions.select_horizontal,
                ['V<CR>'] = actions.select_vertical
            }
        },
        initial_mode = 'normal'
    },
    pickers = {
        buffers = {
            mappings = {
                n = {
                    ["x"] = actions.delete_buffer
                }
            }
        },
        git_status = {
            mappings = {
                n = {
                    ['<CR>'] = actions.git_staging_toggle,
                    ['o'] = actions.select_default
                }
            }
        }
    },
    extensions = {
        fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = "smart_case"
        },
        file_browser = {
            grouped = true,
            respect_gitignore = false,
            hijack_netrw = true,
            display_stat = {size = true},
            mappings = {
                ["n"] = {
                    ['c'] = fb.actions.create,
                    ['d'] = fb.actions.copy,
                    ['m'] = fb.actions.move,
                    ['r'] = fb.actions.rename,
                    ['x'] = fb.actions.remove,
                    ['h'] = fb.actions.toggle_hidden,
                    ['e'] = fb.actions.change_cwd
                }
            }
        }
    }
})

telescope.load_extension "fzf"
telescope.load_extension "file_browser"

map('n', '<Leader>e', builtin.diagnostics)
map('n', '<Leader>b', builtin.buffers)

map('n', '<Leader>gs', builtin.git_status)
map('n', '<Leader>gc', builtin.git_commits)
map('n', '<Leader>gb', builtin.git_branches)
map('n', '<Leader>gh', builtin.git_stash)

map('n', '<Leader>f', fb.file_browser)
