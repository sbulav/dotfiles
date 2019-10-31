"""""""""""""""""""""""""""""""""""""""""
"  Vim configuration file               "
"""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""
"   SHORTCUTS                           "
"   F1   - disabled, use :help          "
"   F2   - change paste mode            "
"   F3   - show netrw                   "
"   F4   - numberToggle on/off          "
"   F5   - run python                   "
"   F7   - run flake8 check(install it! "
"   SPACE - fold/unfold                 "
"   CTRL + SPACE - Code completion      "
"   gcc  - Comment/uncomment a line     "
"""""""""""""""""""""""""""""""""""""""""


set nocompatible
set termguicolors
set background=dark

filetype on
filetype plugin on

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Add all your plugins here (note older versions of Vundle used Bundle instead of Plugin)
Plugin 'vim-scripts/indentpython.vim'
Plugin 'nvie/vim-flake8'
Plugin 'myusuf3/numbers.vim'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-fugitive'
Plugin 'tmhedberg/SimpylFold'
Plugin 'davidhalter/jedi-vim'
Plugin 'glench/vim-jinja2-syntax'        " Jinja support for vim
Plugin 'pearofducks/ansible-vim'
Plugin 'airblade/vim-gitgutter'          " Git line status
Plugin 'lifepillar/vim-solarized8'



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

" Search down into subfolders, use :find <pattern> <TAB> to list results in
" quickwindow
set path+=**

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
if &listchars ==# 'eol:$'
    set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
endif

if v:version > 703 || v:version == 703 && has("patch541")
  set formatoptions+=j " Delete comment character when joining commented lines
endif

" Display and search configuration
"""""""""""""""""""""""""""""""""""""""
set shortmess=a                   " Deal with messages
set nowrap                        " No new line when the line is too long
set showmatch                     " Show matching parenthesis
set ignorecase                    " Basically, ignore case when searching...
set smartcase                     " ...but be smart on the case when searching
set hlsearch                      " Highlight search matches as you type
set incsearch                     " Show search matches as you type
set ruler                         " Display the current cursor position
set display+=lastline             " Indicate that log lines are truncated

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
set wildignore+=*.tar,*.tar.gz,*.xz " Archives
set wildignore+=*.rpm,*.pkg, " Packages
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

" File extensions to append on file jump gf
"""""""""""""""""""""""""""""""""""""""
set suffixesadd+=.c
set suffixesadd+=.html
set suffixesadd+=.json
set suffixesadd+=.yaml
set suffixesadd+=.md
set suffixesadd+=.py


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

" Ansible
augroup vimmic_yaml_jinja2
    autocmd Filetype yaml set filetype=yaml.ansible
    autocmd BufNewFile,BufRead *.j2 set filetype=ruby.jinja2
augroup END

" Key mappings
"""""""""""""""""""

"Get rid of stupid Goddamned help keys
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

" Copy pasting from the system on F2
set pastetoggle=<F2>

" Use netrw as file Explorer
map <silent> <F3> :call ToggleVExplorer()<CR>

"Show/unshow Numbers on F4
nnoremap <F4> :NumbersToggle<CR>

"Execute current buffer on F5
nnoremap <buffer> <F5> :exec '!python' shellescape(@%, 1)<cr>

" Check spelling on F6
nmap <F6> :set spell!<CR>

" space toggle fold
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
vnoremap <Space> zf

" Enable folding with the spacebar
"nnoremap <space> za
" Indent, keep selected text
vmap < <gv
vmap > >gv

" ----------------------------------------------------------------------------
" Quickfix
" ----------------------------------------------------------------------------
nnoremap ]q :cnext<cr>zz
nnoremap [q :cprev<cr>zz
nnoremap ]l :lnext<cr>zz
nnoremap [l :lprev<cr>zz

" ----------------------------------------------------------------------------
" Buffers
" ----------------------------------------------------------------------------
nnoremap ]b :bnext<cr>
nnoremap [b :bprev<cr>

" ----------------------------------------------------------------------------
" Tabs
" ----------------------------------------------------------------------------
nnoremap ]t :tabn<cr>
nnoremap [t :tabp<cr>

" ----------------------------------------------------------------------------
" <tab> / <s-tab> | Circular windows navigation
" ----------------------------------------------------------------------------
nnoremap <tab>   <c-w>w
nnoremap <S-tab> <c-w>W

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

" Highlight all
let python_highlight_all=1

" Folding
"""""""""""""""""""""""""""""
" Enable folding
set foldmethod=indent
set foldlevel=99

" Jedi config
"""""""""""""""""""""""""""""
" Disable choose first function/method at autocomplete
let g:jedi#popup_select_first = 1

" Dont' pop-up on dot
let g:jedi#popup_on_dot = 0

" Leader = \
" Following keymaps are available for Jedi
" let g:jedi#goto_command = "<leader>d"
" let g:jedi#goto_assignments_command = "<leader>g"
" let g:jedi#documentation_command = "K"
" let g:jedi#usages_command = "<leader>n"
" let g:jedi#completions_command = "<C-Space>"
" let g:jedi#rename_command = "<leader>r"


" netrw options
"""""""""""""""""""""""""""""
" Ignore some types of files
let g:netrw_list_hide = '.*\.swp$,.*\.pyc$,^\.git/$,^tags$,^\.vagrant/$'

" Open files in new tab
let g:netrw_browse_split = 3

" Better vimdiff
"""""""""""""""""""""""""""""
" Use patience GIT diff algorithm for block comparison and indent-heuristic
" for better indentation
if has("patch-8.1.0360")
    set diffopt+=internal,algorithm:patience,indent-heuristic
endif

" Use sane colorscheme in diff mode
colorscheme solarized8_high
if &diff
    colorscheme industry
endif

" Better grep
"""""""""""""""""""""""""""""
" If OS has ag installed, use it instead of grp
if executable("ag")
    set grepprg=ag\ --nogroup\ --nocolor\ --ignore-case\ --column
    set grepformat=%f:%l:%c:%m,%f:%l:%m
endif


" Managing files with shortcuts, default leader '\'
"""""""""""""""""""""""""""""
" Add files with wildcards, like *.md
nnoremap <leader>a :argadd <c-r>=fnameescape(expand('%:p:h'))<cr>/*<C-d>
" Display all buffers
nnoremap <leader>b :b <C-d>
" Open a single file
nnoremap <leader>e :e **/
" Quickly go to grep,
nnoremap <leader>g :grep<space>
" Jump to tags selection, use ctags to generate ones
nnoremap <leader>j :tjump /
" Simply run a make command
nnoremap <leader>m :make<cr>
" Run a function to strip trailing whitespaces
nnoremap <leader>s :call StripTrailingWhitespace()<cr>
" Switch to last edited buffer
nnoremap <leader>q :b#<cr>


" Functions
" Function to strip trailing whitespaces
function! StripTrailingWhitespace()
  if !&binary && &filetype != 'diff'
    normal mz
    normal Hmy
    %s/\s\+$//e
    normal 'yz<CR>
    normal `z
  endif
endfunction

" Function for opening and closing netrw Explorer window
function! ToggleVExplorer()
    if exists("t:expl_buf_num")
        let expl_win_num = bufwinnr(t:expl_buf_num)
        let cur_win_num = winnr()

        if expl_win_num != -1
            while expl_win_num != cur_win_num
                exec "wincmd w"
                let cur_win_num = winnr()
            endwhile

            close
        endif

        unlet t:expl_buf_num
    else
         Vexplore
         let t:expl_buf_num = bufnr("%")
    endif
endfunction
