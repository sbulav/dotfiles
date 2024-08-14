-- <Enter> on multiple files - send to quickfix
-- <c-v>: open the selected file in a vertical split
-- <c-x>: open the selected file in a horizontal split
-- <c-t>: open the selected file in a new tab
-- <c-s>: close the current yazi directory using telescope's live_grep. If telescope is not available, nothing happens. You can customize the search action in your configuration.
---@type LazySpec
return {
    "mikavilpas/yazi.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    event = "VeryLazy",
    keys = {
        -- 👇 in this section, choose your own keymappings!
        {
            "<F3>",
            function()
                require("yazi").yazi()
                -- FIXME: avoid messages each time when openint yazi on mac
                print "yazi opened"
            end,
            desc = "Open the file manager",
        },
        keymaps = {
            show_help = "<f1>",
            open_file_in_vertical_split = "<c-v>",
            open_file_in_horizontal_split = "<c-x>",
            open_file_in_tab = "<c-t>",
            grep_in_directory = "<c-s>",
            replace_in_directory = "<c-g>",
            cycle_open_buffers = "<tab>",
            copy_relative_path_to_selected_files = "<c-y>",
            send_to_quickfix_list = "<c-q>",
        },
        {
            -- Open in the current working directory
            "<leader>cw",
            function()
                require("yazi").yazi(nil, vim.fn.getcwd())
            end,
            desc = "Open the file manager in nvim's working directory",
        },
    },
    ---@type YaziConfig
    opts = {
        open_for_directories = false,
    },
}
