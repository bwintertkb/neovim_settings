vim.g.copilot_filetypes = { xml = false, markdown = false }


vim.cmd[[imap <silent><script><expr> <C-f> copilot#Accept("\<CR>")]]
vim.cmd[[imap <A-0> <Plug>(copilot-next)]]
vim.cmd[[imap <A-9> <Plug>(copilot-previous)]]
 

vim.g.copilot_no_tab_map = true

vim.cmd[[highlight CopilotSuggestion guifg=#555555 ctermfg=8]]

