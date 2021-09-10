local actions = require('telescope.actions')

-- Global remapping
------------------------------
require('telescope').setup{
  defaults = {
    mappings = {
      i = {
        ['<CR>'] = actions.select_default + actions.center,
        ['<C-v>'] = actions.select_vertical,
        ['<C-x>'] = actions.select_horizontal,
        ['<C-t>'] = actions.select_tab,
        ['<C-c>'] = actions.close,
        -- ['<Esc>'] = actions.close,

        ['<C-u>'] = actions.preview_scrolling_up,
        ['<C-d>'] = actions.preview_scrolling_down,
        -- Replace current quickfix with selected Telescope entries(or all entries)
        ['<C-q>'] = actions.smart_send_to_qflist + actions.open_qflist,
        -- Add entries to current quickfix (selected or all entries)
        ['<C-a>'] = actions.smart_add_to_qflist,
        ['<Tab>'] = actions.toggle_selection,
        -- ["<C-w>l"] = actions.preview_switch_window_right,
      },
      n = {
        ['<CR>'] = actions.select_default + actions.center,
        ['<C-v>'] = actions.select_vertical,
        ['<C-x>'] = actions.select_horizontal,
        ['<C-t>'] = actions.select_tab,
        ['<C-c>'] = actions.close,
        ['<Esc>'] = actions.close,

        ["j"] = actions.move_selection_next,
        ["k"] = actions.move_selection_previous,

        ['<C-u>'] = actions.preview_scrolling_up,
        ['<C-d>'] = actions.preview_scrolling_down,
        -- Replace current quickfix with selected Telescope entries(or all entries)
        ['<C-q>'] = actions.smart_send_to_qflist + actions.open_qflist,
        -- Add entries to current quickfix (selected or all entries)
        ['<C-a>'] = actions.smart_add_to_qflist,
        ['<Tab>'] = actions.toggle_selection,
        -- ["<C-w>l"] = actions.preview_switch_window_right,
      }
    },
  }
}
