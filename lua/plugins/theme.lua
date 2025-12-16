return {
  {
    "blazkowolf/gruber-darker.nvim",
    lazy = false, -- Load immediately
    priority = 1000, -- Load before other UI plugins
    opts = {
      bold = false, -- Disable bold globally
      italic = {
        strings = false, -- Disable italic comments
        comments = false, -- Disable italic comments
        operators = false, 
        folds = false,
      },
      -- Optional: you can also disable undercurl/underline if desired
      -- undercurl = false,
      -- underline = false,
    },
    config = function(_, opts)
      require("gruber-darker").setup(opts)
      vim.cmd.colorscheme("gruber-darker")
    end,
  },
}
