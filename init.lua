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

-- Auto-reload DOS files as DOS
vim.api.nvim_create_autocmd("BufReadPost", {
  pattern = "*",
  callback = function()
    if vim.bo.fileformat == "unix" then
      local has_cr = vim.fn.search("\\r", "nw") ~= 0
      if has_cr then
        vim.cmd("e ++ff=dos")
      end
    end
  end,
})

-- Load your custom commands (Safe to keep, assuming this file exists)
require('vim-commands')

-- =========================================
-- 2. LAZY.NVIM BOOTSTRAP (Replaces Packer)
-- =========================================
-- This code automatically downloads lazy.nvim if you don't have it.
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- This replaces `require('packer_plugins')`
-- We tell Lazy to import any file found in 'lua/plugins/*.lua' automatically.
require("lazy").setup({
  spec = {
    -- Import your plugins folder directly
    { import = "plugins" },
  },
  -- Automatically check for plugin updates
  checker = { enabled = true, notify = false },
})

-- =========================================
-- 3. DIAGNOSTICS CONFIG (Unchanged)
-- =========================================
vim.diagnostic.config({
  virtual_text = {
    source = "if_many",
    prefix = '●',
    spacing = 4,
  },
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
})
