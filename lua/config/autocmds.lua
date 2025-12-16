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

vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*",
  callback = function()
    -- Set Inlay Hints to a slightly dark grey
    -- Try #808080 (Medium Grey) or #606060 (Darker Grey)
    vim.api.nvim_set_hl(0, "LspInlayHint", { fg = "#808080", bg = "NONE" })
  end,
})
