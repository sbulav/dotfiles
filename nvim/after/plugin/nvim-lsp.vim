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
autocmd FileType terraform,yaml,bash,python,lua call s:ConfigureBuffer()
