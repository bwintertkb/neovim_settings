vim.o.shell = "/bin/bash"
require("toggleterm").setup({shell = vim.o.shell, direction = "float", open_mapping = [[<C-j>]], close_mapping = [[<C-j>]], size = 10 })
