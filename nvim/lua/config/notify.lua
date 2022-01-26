require("notify").setup {
    -- Animation style (see below for details)
    stages = "fade_in_slide_out",

    -- Default timeout for notifications
    timeout = 1000,

    -- For stages that change opacity this is treated as the highlight behind the window
    background_colour = "Normal",

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
