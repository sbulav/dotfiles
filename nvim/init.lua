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
lua/lsp
- Plugins
~/.local/share/nvim/lazy/
- Undo, logs, swap
~/.local/share/nvim/

]]

require "utils"
require "config.options"
require "config.lazy"
require "config.autocommands"
require "config.mappings"
require "config.nvim_help"
require "config.filetype"
