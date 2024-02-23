-- Better work with quickfix
return {
    "stevearc/qf_helper.nvim",
    event = "VeryLazy",
    config = function()
        require("qf_helper").setup {
            quickfix = {
                autoclose = true, -- Autoclose qf if it's the only open window
                default_bindings = true, -- Set up recommended bindings in qf window
                default_options = true, -- Set recommended buffer and window options
                max_height = 10, -- Max qf height when using open() or toggle()
                min_height = 1, -- Min qf height when using open() or toggle()
                track_location = false, -- Keep qf updated with your current location
            },
        }
    end,
}
