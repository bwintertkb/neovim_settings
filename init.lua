vim.g.mapleader = " "
vim.api.nvim_set_keymap('i', 'jk', '<ESC>', { noremap = true })
vim.o.relativenumber = true
vim.o.autoindent = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.smarttab = true
vim.o.softtabstop=4
vim.o.termguicolors = true
vim.o.scrolloff = 10
vim.keymap.set('n', '<leader>;', 'A;', {noremap = true})
-- All yanks go to clipboard register.
vim.cmd('set clipboard=unnamedplus')
-- Add new line above
vim.keymap.set('n', '<leader>=', 'O<ESC>j', {noremap = true})
-- Add new line below
vim.keymap.set('n', '<leader>-', 'o<ESC>k', {noremap = true})
-- Restart nvim 
vim.keymap.set('n', '<leader>sr', ':luafile %<CR>', {noremap = true})
-- Map move to start of line
vim.keymap.set('n', 'H', '^', {noremap = true})
-- Map move to end of line
vim.keymap.set('n', 'L', '$', {noremap = true})
require('vim-commands')
require('packer-plugins')
