" Files & Buffers
"""""""""""""""""""""""""""""""""""""""
set hidden                      " Do not close the buffers, hide them
set history=1000                " Remember more commands and search history
set undolevels=1000             " Remember more levels of undo
set noerrorbells                " No buzz on error
set novisualbell                " No 'visual buzz' on error
set t_vb=                       " Same as above
set autoread                    " Reload the file if changed from the outside
set switchbuf=useopen           " if opening a file from :ls, :buffers, :files, etc. jump to open version
                                " of the file, if one exists
set clipboard+=unnamedplus      " Use * and + registers to access system clipboard(i.e. tmux)
set confirm                     " dialog foor unsaved changes
set splitright                  " go to right pane by default (Needed for quickmenu)

" Terminal/GUI setup
scriptencoding utf-8              " Fix encoding
set guifont=inconsolata           " For people prefering GVim
set fillchars+=vert:•             " Prefere a dot over a pipe
"set mouse=a                       " Use mouse when using vim (tip: maj during
                                  " selection to use ctrl-maj-c to copy text)
" smooth redraw
set lazyredraw

" Show keys in status
set showcmd

" Option to make clean session with mksession (usefull when changing vimrc)
set sessionoptions=buffers,curdir,tabpages,winpos,winsize

" Search down into subfolders, use :find <pattern> <TAB> to list results in
" quickwindow
set path+=**
set path-=/usr/include

" Indentation
"""""""""""""""""""""""""""""""""""""""
" Global configuration
set expandtab                     " Transform kitten killer tabs to spaces
set tabstop=2                     " Number of visual spaces per tab
set shiftwidth=2                  " Number of spaces to use for autoindent
set backspace=indent,eol,start    " Allow backspacing over everything in
                                  " insert mode
set autoindent                    " Always set autoindent on
set copyindent                    " Copy the previous indentation on autoindent
set shiftround                    " Use n shiftwidth when indenting with <>
set smarttab                      " Use smart removal when using tabs
set nojoinspaces                  " one space after joining lines with poncutation

" Enable folding
set foldmethod=indent
set foldlevel=99

" Trailing / tabs
set list
if &listchars ==# 'eol:$'
    set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
endif

if v:version > 703 || v:version == 703 && has("patch541")
  set formatoptions+=j " Delete comment character when joining commented lines
endif

" Make Sure that Vim returns to the same line when we reopen a file"
augroup line_return
    autocmd!
    autocmd BufReadPost *
                \ if line("'\"") > 0 && line("'\"") <= line("$") |
                \ execute 'normal! g`"zvzz' |
                \ endif
augroup END

" Highlight yanked text in neovim
if exists('##TextYankPost')
    autocmd TextYankPost * lua vim.highlight.on_yank {higroup="IncSearch", timeout=1500, on_visual=true}
endif

" Better vimdiff
"""""""""""""""""""""""""""""
" Use patience GIT diff algorithm for block comparison and indent-heuristic
" for better indentation
if has("patch-8.1.0360")
    set diffopt+=internal,algorithm:patience,indent-heuristic
endif

" Use sane colorscheme in diff mode
if &diff
    " colorscheme industry
    syntax off
endif

" Better grep
"""""""""""""""""""""""""""""
" If OS has rg installed, use it instead of grep
if executable("rg")
    set grepprg=rg\ --vimgrep
endif

" Set tags to .git folder(as it was removed in Fugitive)
"""""""""""""""""""""""""""""
set tags^=.git/tags;~
