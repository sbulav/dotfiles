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
- LSP settings and keymappings
lua/lspnew.lua
- Plugins
~/.local/share/nvim/site/pack/packer/
- Undo, logs, swap
~/.local/share/nvim/

]]

require'utils'
require'packages'
require'options'
require'autocommands'
require'mappings'
require'nvim_help'
