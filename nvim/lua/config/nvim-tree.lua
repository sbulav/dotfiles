--[[ local nvimtree = prequire("nvim-tree.lua")
if not nvimtree then
  return
end ]]
-- File explorer config
vim.g.nvim_tree_width = 40
vim.g.open_on_setup = 1
vim.g.nvim_tree_auto_ignore_ft = {'startify', 'dashboard'}
vim.g.auto_close = 1
vim.g.nvim_tree_quit_on_open = 1
-- vim.g.update_focused_file.enable = 0
vim.g.nvim_tree_hide_dotfiles = 0
vim.g.nvim_tree_ignore = { '.swp', '.pyc', '.git', 'node_modules', '.cache' }
vim.g.nvim_tree_side = 'left'
require'nvim-tree'.setup {}
--[[ vim.g.nvim_tree_bindings = {
    edit = { '<CR>', 'o' },
    edit_vsplit = '<C-v>',
    edit_split = '<C-x>',
    toggle_ignored = 'I',
    toggle_dotfiles = 'H',
    refresh = 'R',
    preview = '<Tab>',
    cd = '<C-]>',
    create = 'a',
    remove = 'd',
    rename = 'r',
    cut = 'x',
    copy = 'c',
    paste = 'p',
    prev_git_item = '[c',
    next_git_item = ']c',
} ]]
-- vim.api.nvim_set_keymap('n', '<F3>', ':NvimTreeToggle<cr><paste>', { noremap = true, silent = false })