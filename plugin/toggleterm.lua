if vim.fn.has("win32") then
    vim.o.shell = "cmd.exe"
else
    vim.o.shell = "/bin/bash"
end

require("toggleterm").setup({
    shell = vim.o.shell,
    direction = "float",
    open_mapping = [[<C-j>]],
    close_mapping = [[<C-j>]],
    size = 10
})
