-- ~/.config/nvim/lua/config/autocmds.lua

local function set_inlay_hints()
  -- Use a noticeably lighter grey. 
  -- #C0C0C0 is Silver/Light Grey. 
  -- #909090 is Medium Grey.
  vim.api.nvim_set_hl(0, "LspInlayHint", { fg = "#808080", bg = "NONE" })
end

-- 1. Apply the color IMMEDIATELY (Fixes the startup issue)
set_inlay_hints()

-- 2. Apply the color whenever the colorscheme changes (Fixes theme switching)
vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*",
  callback = set_inlay_hints,
})
