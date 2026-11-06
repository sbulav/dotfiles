--[[
"""""""""""""""""""""""""""""""""""""""""
"  Vim configuration file               "--{{{
"""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""
"   SHORTCUTS                           "
"   F1   - toggle colorcolumn at 81     "
"   F3   - open yazi file manager       "
"   F4   - toggle relativenumber        "
"   F5/F6 - filetype runners (nredir)   "
"   F6   - toggle spell (fallback)      "
"   F7   - LSP outline (Lspsaga)        "
"   F8   - :InspectTree                 "
"   F9   - show lsp log                 "
"   F12  - :LspStart (C-F12 :LspStop)   "
"   SPACE - leader                      "
"   gcc  - Comment/uncomment a line     "
"""""""""""""""""""""""""""""""""""""""""--}}}

- Global keymappings
after/plugin/keymap.vim
- LSP settings and keymappings
lua/lsp
- Plugins
~/.local/share/nvim/lazy/
- Undo, logs, swap (stdpath("state"))
~/.local/state/nvim/

]]

require "utils"
require "config.options"
require "config.lazy"
require "config.autocommands"
require "config.mappings"
require "config.nvim_help"
require "config.filetype"
