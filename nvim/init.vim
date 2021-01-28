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
"   F8   - show Treesitter Playground   "
"   F9   - show lsp logs                "
"   SPACE - fold/unfold                 "
"   gcc  - Comment/uncomment a line     "
"""""""""""""""""""""""""""""""""""""""""

" Global keymappings
" after/plugin/keymap.vim
"
" LSP keymappings
" lua/lsp-config.lua
"
" Plugins, Undo, logs, swap
" ~/.local/share/nvim/
runtime plugins.vim
runtime settings.vim
runtime theme.vim

" reference config
" https://github.com/anfedu/nvim-lua/blob/83dc5ee753c1a80d48920f048048d9f52609533f/lua/lsp/langserver.lua
" Filetype detection and syntax markup
"""""""""""""""""""""""""""""""""""""""
" execute buffer for various languages
augroup makeCmd
  autocmd!
  au FileType go         call SetComp ('go', 'go run %')
  au FileType python     call SetComp ('python', 'python %')
  au FileType terraform  call SetComp ('', 'terraform plan -no-color')
  au FileType sh         call SetComp ('', 'bash %')
  au FileType helm       call SetComp ('helm', 'helm lint')
augroup ENDw

lua require'tree'
lua require'global'
