local set = vim.opt
local let = vim.g

set.hlsearch           = false
set.incsearch          = true
set.ignorecase         = true
set.smartcase          = true

set.number             = true
set.relativenumber     = true
set.confirm            = true

set.smarttab           = true
set.expandtab          = true
set.smartindent        = true
set.expandtab          = true
set.tabstop            = 4
set.shiftwidth         = 4

set.list               = true
set.listchars          = { tab = '<=>', leadmultispace = '---+', trail = '~', nbsp = '~', extends = '>', precedes = '<' }

set.scrolloff          = 4

set.shell              = "fish"

set.mouse              = nil

set.cursorline         = true

set.termguicolors      = true

set.showcmd            = true
let.loaded_netrw       = 1
let.loaded_netrwPlugin = 1
