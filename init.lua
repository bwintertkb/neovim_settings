vim.g.mapleader = " "
vim.api.nvim_set_keymap('i', 'jk', '<ESC>', { noremap = true })
vim.o.relativenumber = true
vim.o.autoindent = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.smarttab = true
vim.o.softtabstop=4
vim.o.termguicolors = true
vim.keymap.set('n', '<leader>;', 'A;', {noremap = true})
-- Add new line above
vim.keymap.set('n', '<leader>=', 'O<ESC>j', {noremap = true})
-- Add new line below
vim.keymap.set('n', '<leader>-', 'o<ESC>k', {noremap = true})

require('vim-commands')
require('packer-plugins')
require('enclose_nav')

