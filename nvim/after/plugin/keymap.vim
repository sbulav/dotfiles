" Key mappings
"""""""""""""""""""

augroup pscbindings
  autocmd!
  autocmd FileType yaml nnoremap <buffer> <F5> :Nredir !kubectl apply --dry-run -o yaml -f %<cr>
  autocmd FileType yaml nnoremap <buffer> <F6> :Nredir !kubectl apply -f %<cr>
  autocmd FileType helm nnoremap <buffer> <F5> :Nredir !helm install . --dry-run --debug --generate-name <cr>
  autocmd FileType helm nnoremap <buffer> <F6> :Nredir !helm template . <cr>
  " autocmd FileType python nnoremap <buffer> <F5> :Nredir !pytest --kube-config=$KUBECONFIG<cr>
  autocmd FileType python nnoremap <buffer> <F5> :Nredir !python %<cr>
  autocmd FileType terraform nnoremap <buffer> <F5> :Nredir !terraform plan -no-color<cr>
  autocmd FileType terraform nnoremap <buffer> <F6> :Nredir !terraform apply --auto-approve<cr>
augroup end

" Get rid of stupid Goddamned help keys
inoremap <silent> <F1> <ESC>:execute "set colorcolumn=" . (&colorcolumn == "" ? "81" : "")<CR>a
nnoremap <silent> <F1> :execute "set colorcolumn=" . (&colorcolumn == "" ? "81" : "")<CR>
vnoremap <F1> <ESC>

" Copy pasting from the system on F2
set pastetoggle=<F2>

" Use netrw as file Explorer
" Moved to LUA
" map <silent> <F3> :call ToggleVExplorer()<CR>

" Show/unshow Numbers on F4
nnoremap <F4> :NumbersToggle<CR>

" Execute current buffer on F5
nnoremap <buffer> <F5> :exec '!python' shellescape(@%, 1)<cr>

" Check spelling on F6
nmap <F6> :set spell!<CR>

" Show lsp log
nnoremap <F9> :Nredir !tail -100 ~/.local/share/nvim/lsp.log<cr>

" Show lsp status
nnoremap <F10> :lua print(vim.inspect(vim.lsp.buf_get_clients()))<cr>

" space toggle fold
" nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
" vnoremap <Space> zf

" reset searchhighlight
nnoremap <silent>zz :nohlsearch<cr>
" Enable folding with the spacebar
"nnoremap <space> za
" Indent, keep selected text
vmap < <gv
vmap > >gv

" Call Train
nnoremap <silent> zx :call train#show_matches(['gM', 'b', 'B','{','}','(', ')',']]','[[','H','M','L'])<cr>
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

map <Space> <Leader>
" Add files with wildcards in CWD, like *.md
nnoremap <leader>a :argadd <C-R>=fnameescape(expand('%:p:h'))<cr>/*<C-d>
" Add files with wildcards in subfolders, like *.md
nnoremap <leader>A :argadd <C-R>=fnameescape(expand('%:p:h')).'/**/*'<CR>
" Telescope
" <c-x>,<c-v> open in split/vsplit, <c-u>,<c-d> up/down preview
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fa <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').oldfiles()<cr>
nnoremap <leader>fm <cmd>lua require('telescope.builtin').keymaps()<cr>
nnoremap <leader>fM <cmd>lua require('telescope.builtin').marks()<cr>
nnoremap <leader>ft <cmd>lua require('telescope.builtin').help_tags()<cr>
nnoremap <leader>fc <cmd>lua require('telescope.builtin').git_commits()<cr>
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
" Use Nredir function to open vim command in split
nnoremap <leader>R :Nredir <c-f>A
" Open vimrc
nnoremap <leader>rc :edit $MYVIMRC<CR>
" Global replace word under cursor
nnoremap <leader>% :%s/\<<C-r>=expand('<cword>')<CR>\>/
" Change project folder to current file's directory for current window
nnoremap <leader>c :lcd %:p:h<cr>
" Close all buffers except currnent one
nnoremap <leader>o :w <bar> %bd <bar> e# <bar> bd# <CR>
" Open terminal
nnoremap <leader>to :terminal<cr>
" Exit terminal insert mode
if has("nvim")
  au TermOpen * tnoremap <buffer> <Esc> <c-\><c-n>
endif
" Open command window on ;
nnoremap ; q:A
" escape works in command window
autocmd CmdwinEnter * nnoremap <buffer> <Esc> <C-c>
" Call completion
inoremap <silent><expr> <c-space> completion#trigger_completion()

" vim-test mappings

nmap <silent> <leader>tn :TestNearest<CR>
nmap <silent> <leader>tf :TestFile<CR>
nmap <silent> <leader>ts :TestSuite<CR>
nmap <silent> <leader>tl :TestLast<CR>
nmap <silent> <leader>tv :TestVisit<CR>Folding

" vim-sneak mappings

map f <Plug>Sneak_s
map F <Plug>Sneak_S

"-----------------------------------------------------------------------------
" completion-nvim settings
"-----------------------------------------------------------------------------
" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Nvim-lsp keymaps defined in after/plugin/nvim-lsp.vim
