-- Better work with quickfix
return {
    "stevearc/quicker.nvim",
    event = "FileType qf",
    keys = {
        {
            "<leader>q",
            function()
                require("quicker").toggle()
            end,
            desc = "toggle-quickfix",
        },
        {
            "<leader>l",
            function()
                require("quicker").toggle { loclist = true }
            end,
            desc = "toggle-loclist",
        },
    },
    opts = {
        keys = {
            {
                ">",
                function()
                    require("quicker").expand { before = 2, after = 2, add_to_existing = true }
                end,
                desc = "Expand quickfix context",
            },
            {
                "<",
                function()
                    require("quicker").collapse()
                end,
                desc = "Collapse quickfix context",
            },
        },
    },
}
