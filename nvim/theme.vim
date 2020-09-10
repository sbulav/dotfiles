" Visual customizations
"""""""""""""""""""""""""""""""""""""""
set termguicolors
set background=dark

" Display and search configuration
""""""""""""""""""""""""""""""""""""""""
colorscheme solarized8_high
" set shortmess=a                   " Deal with messages
set nowrap                        " No new line when the line is too long
set showmatch                     " Show matching parenthesis
set ignorecase                    " Basically, ignore case when searching...
set smartcase                     " ...but be smart on the case when searching
set hlsearch                      " Highlight search matches as you type
set incsearch                     " Show search matches as you type
set inccommand=nosplit            " Show result of substitution immediately
set ruler                         " Display the current cursor position
set display+=lastline             " Indicate that log lines are truncated

" Readability
"""""""""""""""""""""""""""""""""""""""
syntax on
set number                        " Always show line number
set cursorline                    " Change the current line background
set scrolloff=8                   " Keep 8 line above and under the current one
set laststatus=2
set showtabline=0
set guioptions-=e

" Cursor
"""""""""""""""""""""""""""""""""""""""
" Show cursorline only for active window
augroup cline
    autocmd!
    autocmd WinLeave,InsertEnter * set nocursorline
    autocmd WinEnter,InsertLeave * set cursorline
augroup END

" http://vim.wikia.com/wiki/Change_cursor_shape_in_different_modes
let &t_SI = "\<Esc>[6 q"
let &t_SR = "\<Esc>[4 q"
let &t_EI = "\<Esc>[2 q"
