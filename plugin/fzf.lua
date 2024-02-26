vim.keymap.set("n", "<c-u>",
  "<cmd>lua require('fzf-lua').live_grep()<CR>", { silent = true })

vim.keymap.set("n", "<c-p>",
  "<cmd>lua require('fzf-lua').files()<CR>", { silent = true })
