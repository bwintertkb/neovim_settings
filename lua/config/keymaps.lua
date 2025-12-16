-- =========================================
-- 1. BASIC SETTINGS & KEYMAPS (Unchanged)
-- =========================================
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
vim.cmd('set clipboard=unnamedplus') -- All yanks go to clipboard register.

-- Add new line above/below
vim.keymap.set('n', '<leader>=', 'O<ESC>j', { noremap = true })
vim.keymap.set('n', '<leader>-', 'o<ESC>k', { noremap = true })

-- Restart nvim (Note: This is less useful with Lazy, but I kept it)
vim.keymap.set('n', '<leader>sr', ':luafile %<CR>', { noremap = true })

-- Map move to start/end of line
vim.keymap.set({ 'n', 'v' }, 'H', '^', { noremap = true })
vim.keymap.set({ 'n', 'v' }, 'L', '$', { noremap = true })

-- Use unix line endings
vim.keymap.set("n", "<C-M>", [[:%s/\r//g<CR>]], { desc = "Remove ^M (CR) chars" })

-- Jump backward/forward
vim.keymap.set('n', '<C-j>', '<C-o>', { noremap = true })
vim.keymap.set('n', '<C-_>', '<C-i>')

vim.o.encoding = "utf-8"
vim.o.fileencoding = "utf-8"

