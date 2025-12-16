return {
  {
    "bwintertkb/no-clown-fiesta.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      local plugin = require("no-clown-fiesta")
      
      -- Define a plain style (no bold, no italic)
      local plain = { bold = false, italic = false }

      plugin.setup({
        theme = "dim", -- or "dark", "light"
        transparent = false,
        styles = {
          -- Enforce plain text for all semantic groups
          comments = plain,
          functions = plain,
          keywords = plain,
          lsp = plain,
          match_paren = plain,
          type = plain,
          variables = plain,
        },
      })

      -- Load the colorscheme
      plugin.load()

      -- OPTIONAL: Force-disable bold/italic for ANY remaining groups
      -- (This catches specific plugin highlights or UI elements not covered above)
      local groups = vim.fn.getcompletion("", "highlight")
      for _, group in ipairs(groups) do
        local hl = vim.api.nvim_get_hl(0, { name = group })
        if hl.bold or hl.italic then
          hl.bold = false
          hl.italic = false
          vim.api.nvim_set_hl(0, group, hl)
        end
      end
    end,
  },
}
