require('config.autocmds')
require('config.diagnostics')
require('config.keymaps')

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
