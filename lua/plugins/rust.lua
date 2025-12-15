return {
  "rust-lang/rust.vim",
  ft = "rust",
  init = function()
    -- These globals must be set BEFORE the plugin loads
    vim.g.rustfmt_autosave = 1
    vim.g.rustfmt_options = '--config max_width=120'
  end
}
