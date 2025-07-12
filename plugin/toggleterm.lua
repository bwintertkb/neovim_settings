--if vim.fn.has("win32") then
--    vim.o.shell = "cmd.exe"
--else
--    vim.o.shell = "/bin/bash"
--end

-- require("toggleterm").setup({
--     --shell = vim.o.shell,
--     direction = "float",
--     open_mapping = [[<C-j>]],
--     close_mapping = [[<C-j>]],
--     size = 10
-- })
--
-- TLDR

-- TLDR

local function toggle_vertical_term()
  if vim.bo.buftype == "terminal" then
    vim.cmd("close")
  else
    vim.cmd("rightbelow vsplit")
    vim.cmd("vertical resize -30")
    vim.cmd("terminal")
  end
end

local function toggle_horizontal_term()
  if vim.bo.buftype == "terminal" then
    vim.cmd("close")
  else
    vim.cmd("belowright split")
    vim.cmd("resize -10")
    vim.cmd("terminal")
  end
end

-- Map <C-j> to toggle vertical terminal (on the right)
vim.keymap.set("n", "<leader>j", toggle_vertical_term)

-- Map <C-J> to toggle horizontal terminal (at the bottom)
vim.keymap.set("n", "<leader>m", toggle_horizontal_term)

-- When in a terminal window, pressing jk goes from insert to normal mode
vim.cmd([[
  autocmd TermOpen * tnoremap <buffer> jk <C-\><C-n>
]])
