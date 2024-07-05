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
            end,
            desc = "Open the file manager",
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
