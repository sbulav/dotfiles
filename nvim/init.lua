--[[
"""""""""""""""""""""""""""""""""""""""""
"  Vim configuration file               "--{{{
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
"""""""""""""""""""""""""""""""""""""""""--}}}

- Global keymappings
after/plugin/keymap.vim
- LSP keymappings
lua/lsp/keybindings.lua
- Plugins
~/.local/share/nvim/site/pack/packer/
- Undo, logs, swap
~/.local/share/nvim/

]]

require'packages'
require'lsp'
require'options'
require'tree'
require'autocommands'

--[[{{{
" Filetype detection and syntax markup
"""""""""""""""""""""""""""""""""""""""
" execute buffer for various languages
" augroup makeCmd
"   autocmd!
"   au FileType go         call SetComp ('go', 'go run %')
"   au FileType python     call SetComp ('', 'python %')
"   au FileType terraform  call SetComp ('', 'terraform plan -no-color')
"   au FileType sh         call SetComp ('', 'bash %')
"   au FileType helm       call SetComp ('helm', 'helm lint')
" augroup ENDw
]]--}}}
