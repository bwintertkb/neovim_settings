vim.g.mapleader = " "
vim.api.nvim_set_keymap('i', 'jk', '<ESC>', { noremap = true })
vim.o.relativenumber = true
vim.o.autoindent = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.smarttab = true
vim.o.softtabstop = 4
vim.o.termguicolors = true
vim.o.scrolloff = 10
vim.o.wildmenu = true
vim.o.wildmode = 'full'
vim.keymap.set('n', '<leader>;', 'A;', { noremap = true })
-- All yanks go to clipboard register.
vim.cmd('set clipboard=unnamedplus')
-- Add new line above
vim.keymap.set('n', '<leader>=', 'O<ESC>j', { noremap = true })
-- Add new line below
vim.keymap.set('n', '<leader>-', 'o<ESC>k', { noremap = true })
-- Restart nvim
vim.keymap.set('n', '<leader>sr', ':luafile %<CR>', { noremap = true })
-- Map move to start of line
vim.keymap.set({ 'n', 'v' }, 'H', '^', { noremap = true })
-- Map move to end of line
vim.keymap.set({ 'n', 'v' }, 'L', '$', { noremap = true })
-- Use unix line endings
vim.keymap.set("n", "<C-M>", [[:%s/\r//g<CR>]], { desc = "Remove ^M (CR) chars" })
-- Jump backward (same as <C-o>)
vim.keymap.set('n', '<C-j>', '<C-o>', { noremap = true })
-- Jump forward (same as <C-i>, remapped from Tab)
vim.keymap.set('n', '<C-_>', '<C-i>')
vim.o.encoding = "utf-8"
vim.o.fileencoding = "utf-8"
require('vim-commands')
require('packer-plugins')
