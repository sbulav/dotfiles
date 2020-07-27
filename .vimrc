"""""""""""""""""""""""""""""""""""""""""
"  Vim configuration file               "
"""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""
"   SHORTCUTS                           "
"   F1   - show columnline at 81        "
"   F2   - change paste mode            "
"   F3   - show netrw                   "
"   F4   - numberToggle on/off          "
"   F5   - run buffer is <PRG>          "
"   F7   - run flake8 check(install it! "
"   SPACE - fold/unfold                 "
"   gcc  - Comment/uncomment a line     "
"""""""""""""""""""""""""""""""""""""""""

set termguicolors
set background=dark

if empty(glob('~/.vim/autoload/plug.vim'))
      silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
          \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
        autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
    endif
call plug#begin('~/.vim/plugged')

" Add all your plugins here (note older versions of Vundle used Bundle instead of Plug)
" Interface
Plug 'myusuf3/numbers.vim'             " Intelligently toggle line numbers
Plug 'tpope/vim-commentary'            " Comment stuff in and out
Plug 'tpope/vim-eunuch'                " Integration with UNIX shell
Plug 'tpope/vim-repeat'                " Use dot to repeat more actions
Plug 'tpope/vim-surround'              " Surround objects with parenthesys, quotes and more
Plug 'justinmk/vim-sneak'              " Jump to location specified by two characters
Plug 'romainl/vim-qf'                  " Better work with quickfix
Plug 'mbbill/undotree'                 " Undotree
Plug 'junegunn/fzf.vim'                " Fuzzy finder

" Version Control Plugins
Plug 'airblade/vim-gitgutter'          " Git line status
Plug 'tpope/vim-fugitive'              " Git combine

" Languages
Plug 'elzr/vim-json'                   " Json syntax highlight
Plug 'glench/vim-jinja2-syntax'        " Jinja support for vim
Plug 'pearofducks/ansible-vim'         " Ansible 2.x syntax
Plug 'hashivim/vim-terraform'          " Terraform syntax highlight
Plug 'sbulav/vim-helm'                 " Helm syntax and compiler
Plug 'neovim/nvim-lsp'                 " LSP templates and completions
Plug 'haorenW1025/completion-nvim'     " Async completions for nvim-lsp
Plug 'haorenW1025/diagnostic-nvim'     " Async diagnostincs for nvim-lsp

" Code display
Plug 'lifepillar/vim-solarized8'

" Python
Plug 'nvie/vim-flake8'                 " Check code with flake8
Plug 'tmhedberg/SimpylFold'            " Python code folding
Plug 'Vimjas/vim-python-pep8-indent'   " PEP8 compliant indentation
Plug 'janko/vim-test'                  " Running tests

" Text objects
Plug 'beloglazov/vim-textobj-quotes'     " TO closest pair of quotes of any type iq/aq
Plug 'jceb/vim-textobj-uri'              " TO URL                                iu/au
Plug 'kana/vim-textobj-entire'           " TO entire buffer                      ie/ae
Plug 'kana/vim-textobj-fold'             " TO folding                            iz/az
Plug 'kana/vim-textobj-function'         " TO function                           if/af
Plug 'kana/vim-textobj-indent'           " TO block of code based on indent      ii/ai
Plug 'kana/vim-textobj-line'             " TO line                               il/al
Plug 'kana/vim-textobj-user'             " Allow use of custom textobjects

call plug#end()

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
colorscheme solarized8_high
set shortmess=a                   " Deal with messages
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
set suffixesadd+=.md
set suffixesadd+=.groovy

" Filetype detection and syntax markup
"""""""""""""""""""""""""""""""""""""""
" execute buffer for various languages
augroup makeCmd
  autocmd!
  au FileType go         call SetComp ('go', 'go run %')
  au FileType python     call SetComp ('', 'python %')
  au FileType terraform  call SetComp ('', 'terraform plan -no-color')
  au FileType sh         call SetComp ('', 'bash %')
  au FileType helm       call SetComp ('helm', 'helm lint')
augroup ENDw

augroup pscbindings
  autocmd!
  autocmd FileType yaml nnoremap <buffer> <F5> :Redir !kubectl apply --dry-run -o yaml -f %<cr>
  autocmd FileType yaml nnoremap <buffer> <F6> :Redir !kubectl apply -f %<cr>
  autocmd FileType helm nnoremap <buffer> <F5> :Redir !helm install . --dry-run --debug <cr>
  autocmd FileType python nnoremap <buffer> <F5> :Redir !pytest --kube-config=$KUBECONFIG<cr>
  autocmd FileType terraform nnoremap <buffer> <F5> :Redir !terraform plan -no-color<cr>
  autocmd FileType yaml nnoremap <buffer> <F6> :Redir !terraform apply<cr>
augroup end

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

"
" Filetype specific
"""""""""""""""""""""""""""""""""""""""
" Terraform
augroup vimmic_hcl_comments
    au BufNewFile,BufRead *.tf set filetype=terraform
    autocmd FileType terraform setlocal commentstring=#\ %s
augroup END

" Jenkinsfile
augroup vimmic_groovy_filetype
    au BufNewFile,BufRead *enkinsfile* set filetype=groovy
augroup END

" Key mappings
"""""""""""""""""""
"Get rid of stupid Goddamned help keys
inoremap <silent> <F1> <ESC>:execute "set colorcolumn=" . (&colorcolumn == "" ? "81" : "")<CR>a
nnoremap <silent> <F1> :execute "set colorcolumn=" . (&colorcolumn == "" ? "81" : "")<CR>
vnoremap <F1> <ESC>

" Copy pasting from the system on F2
set pastetoggle=<F2>

" Use netrw as file Explorer
map <silent> <F3> :call ToggleVExplorer()<CR>

" Show/unshow Numbers on F4
nnoremap <F4> :NumbersToggle<CR>

" Execute current buffer on F5
nnoremap <buffer> <F5> :exec '!python' shellescape(@%, 1)<cr>

" Check spelling on F6
nmap <F6> :set spell!<CR>

" space toggle fold
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
vnoremap <Space> zf

" reset searchhighlight
nnoremap <silent>zz :nohlsearch<cr>
" Enable folding with the spacebar
"nnoremap <space> za
" Indent, keep selected text
vmap < <gv
vmap > >gv

" one came from eunich
" :Delete: Delete a buffer and the file on disk simultaneously.
" :Move: Rename a buffer and the file on disk simultaneously.
" :Rename: Like :Move, but relative to the current file's containing directory.
" :Chmod: Change the permissions of the current file.
" :Mkdir: Create a directory, defaulting to the parent of the current file.
" :SudoWrite: Write a privileged file with sudo.
" :SudoEdit: Edit a privileged file with sudo.

" useful ones in insert mode, see :h index
" <c-r> - insert text from register
" <c-a> - last inserted text
" <c-w> - delete one word before cursorc
" <c-o> - execute one normal command and return to insert mode

" ----------------------------------------------------------------------------
" Quickfix
" ----------------------------------------------------------------------------
nnoremap ]q :cnext<cr>zz        " Quickfix next
nnoremap [q :cprev<cr>zz        " Quickfix previous
nnoremap ]Q :cnewer<cr>zz       " Open newer quickfix results
nnoremap [Q :colder<cr>zz       " Open older quickfix results
nnoremap ]l :lnext<cr>zz        " Location next
nnoremap [l :lprev<cr>zz        " Location previous
nmap <silent> <leader>l :call ToggleList("Location List", 'l')<CR> " Open/Close location
nmap <silent> <leader>q :call ToggleList("Quickfix List", 'c')<CR> " Open/Close quickfix

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

" ----------------------------------------------------------------------------
" Managing files with shortcuts, default leader '\'
" ----------------------------------------------------------------------------

" Add files with wildcards in CWD, like *.md
nnoremap <leader>a :argadd <C-R>=fnameescape(expand('%:p:h'))<cr>/*<C-d>
" Add files with wildcards in subfolders, like *.md
nnoremap <leader>A :argadd <C-R>=fnameescape(expand('%:p:h')).'/**/*'<CR>
" Fuzzy commands, use CTRL-T / CTRL-X / CTRL-V key bindings to open in a new
" tab, a new split, or in a new vertical split
" In lines CTRL-A to select all lines and CTRL-T to populate quickfix
nnoremap <leader>fa :Rg<cr>
nnoremap <leader>b :Buffers<cr>
nnoremap <leader>fc :Commits<cr>
nnoremap <leader>ff :Files<cr>
nnoremap <leader>fh :History<cr>
nnoremap <leader>fl :Lines<cr>
nnoremap <leader>fm :Maps<cr>
nnoremap <leader>fo :Commands<cr>
nnoremap <leader>ft :Tags<cr>
" Mapping selecting mappings
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)
" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
" imap <c-x><c-l> <plug>(fzf-complete-line)
" Quickly go to custom Grep
nnoremap <leader>g :Grep<space>
" Invoke Fugitive's Git
nnoremap <leader>G :Git<cr>
" Simply run a make command
nnoremap <leader>m :make<cr>
" Run a function to strip trailing whitespaces
nnoremap <leader>s :call StripTrailingWhitespace()<cr>
" Switch to last edited buffer
nnoremap <leader>le :b#<cr>
" Close current buffer
nnoremap <leader>d :bdelete<cr>
nnoremap <leader>D :bdelete!<cr>
" Undotree
nnoremap <leader>u :UndotreeToggle<cr>
" Reload vim config
nnoremap <leader>r :source $MYVIMRC<CR>
" Use Redir function to open vim command in split
nnoremap <leader>R :Redir <c-f>A
" Open vimrc
nnoremap <leader>rc :edit ~/.vimrc<CR>
" Global replace word under cursor
nnoremap <leader>% :%s/\<<C-r>=expand('<cword>')<CR>\>/
" Change project folder to current file's directory for current window
nnoremap <leader>c :lcd %:p:h<cr>
" Open terminal
nnoremap <leader>to :terminal<cr>
" Exit terminal insert mode
tnoremap <Esc> <C-\><C-n>

" vim-test mappings

nmap <silent> <leader>tn :TestNearest<CR>
nmap <silent> <leader>tf :TestFile<CR>
nmap <silent> <leader>ts :TestSuite<CR>
nmap <silent> <leader>tl :TestLast<CR>
nmap <silent> <leader>tv :TestVisit<CR>Folding
"""""""""""""""""""""""""""""
" Enable folding
set foldmethod=indent
set foldlevel=99

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

" https://gist.github.com/romainl/56f0c28ef953ffc157f36cc495947ab3
" Execute grep in a subshell to avoid annoying confirmation screens
function! Grep(args)
    let args = split(a:args, ' ')
    return system(join([&grepprg, shellescape(args[0]), len(args) > 1 ? join(args[1:-1], ' ') : ''], ' '))
endfunction

" Command to populate quickfix with Grep function results
command! -nargs=+ -complete=file_in_path -bar Grep  cgetexpr Grep(<q-args>)
command! -nargs=+ -complete=file_in_path -bar LGrep lgetexpr Grep(<q-args>)

" Open quickfix automatically if there are valid entries
augroup quickfix
    autocmd!
    autocmd QuickFixCmdPost cgetexpr cwindow
    autocmd QuickFixCmdPost lgetexpr lwindow
augroup END

" Persistent undo
"""""""""""""""""""""""""""""
if has('persistent_undo')
    " define a path to store persistent undo files.
    let target_path = expand('~/.vim/vim-persisted-undo/')    " create the directory and any parent directories
    " if the location does not exist.
    if !isdirectory(target_path)
        call system('mkdir -p ' . target_path)
    endif    " point Vim to the defined undo directory.
    let &undodir = target_path    " finally, enable undo persistence.
    set undofile
endif

" Set tags to .git folder(as it was removed in Fugitive)
"""""""""""""""""""""""""""""
set tags^=.git/tags;~

" Functions
"""""""""""""""""""""""""""""
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

" Utility function for ToggleList
function! GetBufferList()
  redir =>buflist
  silent! ls!
  redir END
  return buflist
endfunction

" Show/close quickfix window
function! ToggleList(bufname, pfx)
  let buflist = GetBufferList()
  for bufnum in map(filter(split(buflist, '\n'), 'v:val =~ "'.a:bufname.'"'), 'str2nr(matchstr(v:val, "\\d\\+"))')
    if bufwinnr(bufnum) != -1
      exec(a:pfx.'close')
      return
    endif
  endfor
  if a:pfx == 'l' && len(getloclist(0)) == 0
      echohl ErrorMsg
      echo "Location List is Empty."
      return
  endif
  let winnr = winnr()
  exec(a:pfx.'open')
  if winnr() != winnr
    wincmd p
  endif
endfunction

" Set makeprg and compiler
function! SetComp(comp, make)
  if !empty(a:comp)
    exec 'compiler '.a:comp
  endif
  if !empty(a:make)
    let &makeprg=a:make
  endif
endfunction

" Make list-like commands more intuitive
function! CCR()
    let cmdline = getcmdline()
    if cmdline =~ '\v\C^(ls|files|buffers)'
        " like :ls but prompts for a buffer command
        return "\<CR>:b"
    elseif cmdline =~ '\v\C/(#|nu|num|numb|numbe|number)$'
        " like :g//# but prompts for a command
        return "\<CR>:"
    elseif cmdline =~ '\v\C^(dli|il)'
        " like :dlist or :ilist but prompts for a count for :djump or :ijump
        return "\<CR>:" . cmdline[0] . "j  " . split(cmdline, " ")[1] . "\<S-Left>\<Left>"
    elseif cmdline =~ '\v\C^(cli|lli)'
        " like :clist or :llist but prompts for an error/location number
        return "\<CR>:sil " . repeat(cmdline[0], 2) . "\<Space>"
    elseif cmdline =~ '\C^old'
        " like :oldfiles but prompts for an old file to edit
        set nomore
        return "\<CR>:sil se more|e #<"
    elseif cmdline =~ '\C^changes'
        " like :changes but prompts for a change to jump to
        set nomore
        return "\<CR>:sil se more|norm! g;\<S-Left>"
    elseif cmdline =~ '\C^ju'
        " like :jumps but prompts for a position to jump to
        set nomore
        return "\<CR>:sil se more|norm! \<C-o>\<S-Left>"
    elseif cmdline =~ '\C^marks'
        " like :marks but prompts for a mark to jump to
        return "\<CR>:norm! `"
    elseif cmdline =~ '\C^undol'
        " like :undolist but prompts for a change to undo
        return "\<CR>:u "
    else
        return "\<CR>"
    endif
endfunction
cnoremap <expr> <CR> CCR()

" Redirect the output of a Vim or external command into a scratch buffer
function! Redir(cmd)
    for win in range(1, winnr('$'))
        if getwinvar(win, 'scratch')
            execute win . 'windo close'
        endif
    endfor
    if a:cmd =~ '^!'
        let cmd = a:cmd =~' %' ? substitute(a:cmd, ' %', ' ' . expand('%:p'), '') : a:cmd
        let output = system(matchstr(cmd, '^!\zs.*'))
    else
        redir => output
        execute a:cmd
        redir END
    endif
    vnew
    let w:scratch = 1
    setlocal buftype=nofile bufhidden=wipe nobuflisted noswapfile
    call setline(1, split(output, "\n"))
endfunction

command! -nargs=1 -complete=command Redir silent call Redir(<q-args>)

" Built-in LSP
"""""""""""""""""""""""""""""""""""""""

" Setup language servers
lua << EOF
	require'nvim_lsp'.yamlls.setup{}
	require'nvim_lsp'.vimls.setup{}
	require'nvim_lsp'.sumneko_lua.setup{}
	require'nvim_lsp'.terraformls.setup{}
EOF

" command to troubleshoot if client is connected
" :lua print(vim.inspect(vim.lsp.buf_get_clients()))

" nvim-lsp Mappings
function! s:ConfigureBuffer()
    nnoremap <buffer> <silent> gd          <cmd>lua vim.lsp.buf.definition()<CR>
    nnoremap <buffer> <silent> K           <cmd>lua vim.lsp.buf.hover()<CR>
    nnoremap <buffer> <silent> gi          <cmd>lua vim.lsp.buf.implementation()<CR>
    nnoremap <buffer> <silent> gr          <cmd>lua vim.lsp.buf.references()<CR>
    nnoremap <buffer> <silent> gs          <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
    " rename currently has issues https://github.com/neovim/neovim/pull/12185
    nnoremap <buffer> <silent> <leader>rn  <cmd>lua vim.lsp.buf.rename()<CR>
    " nnoremap <silent> <leader>f   <cmd>lua vim.lsp.buf.formatting()<CR>

    " Mapping specific to plugins
    nnoremap <buffer> <silent> [e          :NextDiagnostic<CR>
    nnoremap <buffer> <silent> ]e          :PrevDiagnostic<CR>
    nnoremap <buffer> <silent> go          :OpenDiagnostic<CR>

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
autocmd FileType terraform,vim,yaml,bash,lua call s:ConfigureBuffer()

sign define LspDiagnosticsErrorSign text=✖
sign define LspDiagnosticsWarningSign text=⚠
sign define LspDiagnosticsInformationSign text=ℹ
sign define LspDiagnosticsHintSign text=➤

" lua callbacks
:lua << EOF
  local nvim_lsp = require'nvim_lsp'
  local M = {}

  M.on_attach = function()
      require'diagnostic'.on_attach();
      require'completion'.on_attach();
    end

  nvim_lsp.yamlls.setup{ on_attach = M.on_attach; }
  nvim_lsp.vimls.setup{ on_attach = M.on_attach; }
  nvim_lsp.terraformls.setup{ on_attach = M.on_attach; }
EOF

"-----------------------------------------------------------------------------
" completion-nvim settings
"-----------------------------------------------------------------------------
" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
