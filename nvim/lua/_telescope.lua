--[[ local actions = require('telescope.actions')
require'telescope'.setup{
    default_mappings = {
      i = {
        ['<C-j>'] = actions.move_selection_next,
        ['<C-k>'] = actions.move_selection_previous,
        ['<CR>'] = actions.goto_file_selection_edit,

        ['<C-v>'] = actions.goto_file_selection_vsplit,
        ['<C-x>'] = actions.goto_file_selection_split,
        ['<C-t>'] = actions.goto_file_selection_tabedit,
        ['<C-c>'] = actions.close,
        ['<Esc>'] = actions.close,

        ['<C-u>'] = actions.preview_scrolling_up,
        ['<C-d>'] = actions.preview_scrolling_down,
        ['<C-q>'] = actions.send_to_qflist,
        ['<Tab>'] = actions.toggle_selection,
        -- ["<C-w>l"] = actions.preview_switch_window_right,
      },
      n = {
        ['<CR>'] = actions.goto_file_selection_edit,
        ['<C-v>'] = actions.goto_file_selection_vsplit,
        ['<C-x>'] = actions.goto_file_selection_split,
        ['<C-t>'] = actions.goto_file_selection_tabedit,
        ['<Esc>'] = actions.close,

        ["j"] = actions.move_selection_next,
        ["k"] = actions.move_selection_previous,

        ['<C-u>'] = actions.preview_scrolling_up,
        ['<C-d>'] = actions.preview_scrolling_down,
        ['<C-q>'] = actions.send_to_qflist,
        ['<Tab>'] = actions.toggle_selection,
        -- ["<C-w>l"] = actions.preview_switch_window_right,
      }
    },
} ]]
local actions = require('telescope.actions')
-- Global remapping
------------------------------
require('telescope').setup{
  defaults = {
    mappings = {
      i = {
        ['<CR>'] = actions.goto_file_selection_edit,
        ['<C-v>'] = actions.goto_file_selection_vsplit,
        ['<C-x>'] = actions.goto_file_selection_split,
        ['<C-t>'] = actions.goto_file_selection_tabedit,
        ['<C-c>'] = actions.close,
        -- ['<Esc>'] = actions.close,

        ['<C-u>'] = actions.preview_scrolling_up,
        ['<C-d>'] = actions.preview_scrolling_down,
        ['<C-q>'] = actions.send_to_qflist,
        ['<C-s>'] = actions.send_selected_to_qflist,
        ['<Tab>'] = actions.toggle_selection,
        -- ["<C-w>l"] = actions.preview_switch_window_right,
      },
      n = {
        ['<CR>'] = actions.goto_file_selection_edit,
        ['<C-v>'] = actions.goto_file_selection_vsplit,
        ['<C-x>'] = actions.goto_file_selection_split,
        ['<C-t>'] = actions.goto_file_selection_tabedit,
        ['<Esc>'] = actions.close,

        ["j"] = actions.move_selection_next,
        ["k"] = actions.move_selection_previous,

        ['<C-u>'] = actions.preview_scrolling_up,
        ['<C-d>'] = actions.preview_scrolling_down,
        ['<C-q>'] = actions.send_to_qflist,
        ['<C-s>'] = actions.send_selected_to_qflist,
        ['<Tab>'] = actions.toggle_selection,
        -- ["<C-w>l"] = actions.preview_switch_window_right,
      }
    },
  }
}
