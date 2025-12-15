return {
  "bwintertkb/no-clown-fiesta.nvim",
  lazy = false, -- Load immediately during startup
  priority = 1000, -- Load before all other plugins
  config = function()
    require("no-clown-fiesta").setup({
      transparent = false,
      styles = {
        comments = {},
        keywords = {},
        functions = {},
        variables = {},
        type = { bold = false },
        lsp = { underline = true }
      },
    })
    vim.cmd([[colorscheme no-clown-fiesta]])
    -- Set global highlight override
    vim.api.nvim_set_hl(0, "LspInlayHint", { link = "Comment" })
  end,
}
