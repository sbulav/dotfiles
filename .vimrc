"""""""""""""""""""""""""""""""""""""""""
"  Vim configuration file               "
"""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""
"   SHORTCUTS                           "
"   F1   - disable, use :help           "
"   F2   - change paste mode            "
"   F3   - show NerdTree                "
"   F4   - numberToggle on/off          "
"   F5   - run python                   "
"   SPACE - fold/unfold                 "
"   CTRL + SPACE - Code completion      "
"   gcc  - Comment/uncomment a line     "
"""""""""""""""""""""""""""""""""""""""""


set nocompatible
filetype on
filetype plugin on

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Add all your plugins here (note older versions of Vundle used Bundle instead of Plugin)
Plugin 'vim-scripts/indentpython.vim'
Plugin 'vim-syntastic/syntastic'
Plugin 'nvie/vim-flake8'
Plugin 'scrooloose/nerdtree'
Plugin 'myusuf3/numbers.vim'
Plugin 'tpope/vim-commentary'
Plugin 'tmhedberg/SimpylFold'
Plugin 'davidhalter/jedi-vim'
Plugin 'mitsuhiko/vim-jinja'        " Jinja support for vim



" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Files & Buffers
"""""""""""""""""""""""""""""""""""""""
set hidden                      " Do not close the buffers, hide them
set history=1000                " Remember more commands and search history
set undolevels=1000             " Remember more levels of undo
set noerrorbells                " No buzz on error
set novisualbell                " No 'visual buzz' on error
set t_vb=                       " Same as above
set autoread                    " Reload the file if changed from the outside
"set timeout                    " Enable timeout on mapping and key codes
"set timeoutlen=400             " Maximum wait time for command sequence
"set ttimeoutlen=400            " Same as above
set switchbuf=useopen           " if opening a file from :ls, :buffers, :files, etc. jump to open version
                                " of the file, if one exists
set confirm                     " dialog foor unsaved changes
set splitright                  " got to right pane by default (Needed for quickmenu)

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

" Indentation
"""""""""""""""""""""""""""""""""""""""
" Global configuration
set expandtab                     " Transform kitten killer tabs to spaces
set tabstop=4                     " Number of visual spaces per tab
set shiftwidth=4                  " Number of spaces to use for autoindent
set backspace=indent,eol,start    " Allow backspacing over everything in
                                  " insert mode
set autoindent                    " Always set autoindent on
set copyindent                    " Copy the previous indentation on autoindent
set shiftround                    " Use n shiftwidth when indenting with <>
set smarttab                      " Use smart removal when using tabs
set nojoinspaces                  " one space after joining lines with poncutation


" Trailing / tabs
set list
set listchars=tab:▸\ ,extends:❰,nbsp:⇏,trail:•

" Display and search configuration
"""""""""""""""""""""""""""""""""""""""
set shortmess=a                 " Deal with messages
set nowrap                        " No new line when the line is too long
set showmatch                     " Show matching parenthesis
set ignorecase                    " Basically, ignore case when searching...
set smartcase                     " ...but be smart on the case when searching
set hlsearch                      " Highlight search matches as you type
set incsearch                     " Show search matches as you type
set ruler                         " Display the current cursor position

" Readability
"""""""""""""""""""""""""""""""""""""""
syntax on
set number                        " Always show line number
set cursorline                    " Change the current line background
set scrolloff=8                   " Keep 8 line above and under the current one

" Autocompletion
"""""""""""""""""""""""""""""""""""""""
" Wildmenu completion : exclude some files
set wildmenu
set wildmode=list:longest,full
set wildignore+=.hg,.git,.svn " Version Controls
set wildignore+=*.aux,*.out,*.toc " Latex Indermediate files
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg " Binary Imgs
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest " Compiled Object files
set wildignore+=*.spl " Compiled speolling world list
set wildignore+=*.sw? " Vim swap files
set wildignore+=*.DS_Store " OSX SHIT
set wildignore+=*.luac " Lua byte code
set wildignore+=migrations " Django migrations
set wildignore+=*.pyc " Python Object codes
set wildignore+=*.orig " Merge resolution files
set wildignore+=*.class " java/scala class files
set wildignore+=*/target/* " sbt target dires `,`. You can use space
                           " in your local
set completeopt=menu,longest
" automatically open and close the popup menu / preview window
augroup vimmic_popup_menu
    autocmd CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
augroup END


" Cursor
"""""""""""""""""""""""""""""""""""""""
" Show cursorline only for active window
augroup cline
    autocmd!
    autocmd WinLeave,InsertEnter * set nocursorline
    autocmd WinEnter,InsertLeave * set cursorline
augroup END

" http://vim.wikia.com/wiki/Change_cursor_shape_in_different_modes
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" Make Sure that Vim returns to the same line when we reopen a file"
augroup line_return
    autocmd!
    autocmd BufReadPost *
                \ if line("'\"") > 0 && line("'\"") <= line("$") |
                \ execute 'normal! g`"zvzz' |
                \ endif
augroup END

" Filetype specific
"""""""""""""""""""""""""""""""""""""""

augroup vimmic_cmake_filetype
    autocmd BufNewFile,BufRead CMakeLists.txt set filetype=cmake
augroup END

augroup vimmic_xml_matchpair
    autocmd FileType xml,html set matchpairs+=<:>
augroup END

" C/CPP improved indentation
augroup vimmic_cpp_indent
    autocmd FileType c,cpp  set smartindent
augroup END


" Enable folding with the spacebar
nnoremap <space> za

" NerdTree настройки
" показать NERDTree на F3
map <F3> :NERDTreeToggle<CR>
nnoremap <buffer> <F5> :exec '!python' shellescape(@%, 1)<cr>
"игноррируемые файлы с расширениями
let NERDTreeIgnore=['\~$', '\.pyc$', '\.pyo$', '\.class$', 'pip-log\.txt$', '\.o$']  


"Get rid of stupid Goddamned help keys
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

" Copy pasting from the system
set pastetoggle=<F2>

nmap <F6> :set spell!<CR>

" space toggle fold
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
vnoremap <Space> zf

" Indent, keep selected text
vmap < <gv
vmap > >gv

" Completion & code
"""""""""""""""""""

" Code completion via ctrl-space
"inoremap <C-Space> <C-n>
"inoremap <Nul> <C-n>

" Ctrl-x x for cleaver completion
" inoremap <C-x><C-x> <C-x><C-o>
inoremap <C-space> <C-x><C-o>

" remove unwanted trailling spaces, global or in selection
nnoremap <silent> <Leader>pt :0,$call TrimSpaces()<CR>
vnoremap <silent> <Leader>pt :call TrimSpaces()<CR>

" Avoid the non-completing enter key by making it behave like ctrl-y
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

nnoremap <F4> :NumbersToggle<CR>

" Highlight all
let python_highlight_all=1

" Folding
"""""""""""""""""""""""""""""
" Enable folding
set foldmethod=indent
set foldlevel=99
let g:SimpylFold_docstring_preview=1

" Disable choose first function/method at autocomplete
let g:jedi#popup_select_first = 0
