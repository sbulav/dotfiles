" Built-in LSP
"""""""""""""""""""""""""""""""""""""""


lua require'lsp-config'
" command to troubleshoot if client is connected
" :lua print(vim.inspect(vim.lsp.buf_get_clients()))

function! s:ConfigureBuffer()
    if exists('+signcolumn')
      setlocal signcolumn=yes
    endif
    setlocal omnifunc=v:lua.vim.lsp.omnifunc
    " Set completeopt to have a better completion experience
    setlocal completeopt=menuone,noinsert,noselect
    " Avoid showing message extra message when using completion
    setlocal shortmess+=c
    " always show signcolumns
    setlocal signcolumn=yes
endfunction

" nvim-lsp Settings
autocmd FileType terraform,yaml,bash,python call s:ConfigureBuffer()

set_sign("Hint", "➤")
set_sign("Information", "ℹ")
set_sign("Warning", "⚠")
set_sign("Error", "✖")

"-----------------------------------------------------------------------------
" completion-nvim settings
"-----------------------------------------------------------------------------
" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
