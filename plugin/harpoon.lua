require('harpoon').setup()
vim.keymap.set('n', '<A-f>', ':lua require("harpoon.ui").toggle_quick_menu()<CR>', {noremap = true})
vim.keymap.set('n', '<A-d>', ':lua require("harpoon.mark").add_file()<CR>', {noremap = true})
vim.keymap.set('n', '<A-s>', ':lua require("harpoon.ui").nav_prev()<CR>', {noremap = true})
vim.keymap.set('n', '<A-a>', ':lua require("harpoon.ui").nav_next()<CR>', {noremap = true})
