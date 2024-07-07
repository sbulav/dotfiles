return {
    "rcarriga/nvim-notify",
    dependencies = { "echasnovski/mini.nvim" },
    event = "VeryLazy",
    enabled = true,
    config = function()
        require("notify").setup {
            -- Animation style (see below for details)
            stages = "fade_in_slide_out",

            -- Default timeout for notifications
            timeout = 1000,

            -- For stages that change opacity this is treated as the highlight behind the window
            -- background_colour = "Normal",
            -- Used for transparency
            background_colour = "#000000",
            -- Icons for the different levels
            icons = {
                ERROR = "",
                WARN = "",
                INFO = "",
                DEBUG = "",
                TRACE = "✎",
            },
        }
        vim.notify = require "notify"
    end,
}
