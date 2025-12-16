-- =========================================
-- 1. PRE-SETUP (Global Options & Leader)
-- =========================================
-- IMPORTANT: Mapleader must be set BEFORE lazy.setup or plugins load
vim.g.mapleader = " " 
vim.g.maplocalleader = "\\"

-- =========================================
-- 2. LAZY.NVIM BOOTSTRAP
-- =========================================
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

-- =========================================
-- 3. LOAD PLUGINS
-- =========================================
require("lazy").setup({
  spec = {
    { import = "plugins" },
  },
  checker = { enabled = true, notify = false },
})

-- =========================================
-- 4. POST-SETUP (Custom Configs)
-- =========================================
-- Load these AFTER lazy setup so your keymaps override plugin defaults
-- and your autocmds can interact with loaded plugins.
require('config.autocmds')
require('config.diagnostics')
require('config.keymaps')
require('vim-commands')
