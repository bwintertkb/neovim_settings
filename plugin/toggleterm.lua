if vim.fn.has("unix") then
    vim.o.shell = "/bin/bash"
end

require("toggleterm").setup({
    shell = vim.o.shell,
    direction = "float",
    open_mapping = [[<C-j>]],
    close_mapping = [[<C-j>]],
    size = 10
})
