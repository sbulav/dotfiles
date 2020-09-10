" Statusline
"""""""""""""""""""""""""""""""""""""""
" Set statusline transparent
if has("nvim")
    highlight StatusLine NONE
else
    highlight StatusLine ctermbg=0 cterm=NONE
endif
" Left part begins
set statusline=
" Buffer number
set statusline+=[%n]
" Dynamic status line, using built-in HL groups DiffDelete and DiffAdd
set statusline+=\ %#DiffDelete#%{&mod?expand('%'):''}%*%#DiffAdd#%{&mod?'':expand('%')}%*
" Show if file is read-only
set statusline+=%r
" Git branch
set statusline+=\ %{fugitive#head()}
" Center part begins
set statusline+=%=
set statusline+=\ %{&paste?'\ PASTE\ ':''}
" Right part begins
set statusline+=%=
" Show file type
set statusline+=%y
" CursorColumn
set statusline+=%3c
" CurrentLine/TotalLines
set statusline+=\ %l\/%-3L
" Percentage
set statusline+=\ [%p%%]

