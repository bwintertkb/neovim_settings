vim.cmd([[
set mouse=a
let g:lsc_auto_map = {
    \ 'GoToDefinition': '<C-]>',
    \ 'GoToDefinitionSplit': ['<C-W>]', '<C-W><C-]>'],
    \ 'FindReferences': 'gr',
    \ 'NextReference': '<C-n>',
    \ 'PreviousReference': '<C-p>',
    \ 'FindImplementations': 'gI',
    \ 'FindCodeActions': 'ga',
    \ 'ShowHover': v:true,
    \ 'DocumentSymbol': 'go',
    \ 'WorkspaceSymbol': 'gS',
    \ 'SignatureHelp': 'gm',
    \ 'Completion': 'completefunc',
    \}
let g:rustfmt_autosave = 1
inoremap <S-Tab> <C-Q><Tab>
nnoremap gR :lua vim.lsp.buf.rename()<CR>
nnoremap <C-c> :Neotree toggle<CR>
nmap <F8> :TagbarToggle<CR>
let g:transparent_enabled = v:false
tnoremap <leader><Esc> <C-\><C-n>
tnoremap <Esc> <C-\><C-n>
nmap <up> <C-w><up>
nmap <down> <C-w><down>
nmap <left> <C-w><left>
nmap <right> <C-w><right>
nnoremap <silent> <space>q  <cmd>Trouble<CR>
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz
]])
