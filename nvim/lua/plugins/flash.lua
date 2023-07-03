return {
    "folke/flash.nvim",
    event = "VeryLazy",
    ---@type Flash.Config
    opts = {},
    keys = {
        {
            "s",
            mode = { "n", "x", "o" },
            function()
                require("flash").jump()
            end,
            desc = "Flash",
        },
        {
            "zx",
            mode = { "n", "x", "o" },
            function()
                require("flash").jump {
                    search = {
                        mode = function(str)
                            return "\\<" .. str
                        end,
                    },
                }
            end,
            desc = "Flash only beginning of words",
        },
        {
            "zw",
            mode = { "n", "x", "o" },
            function()
                require("flash").jump {
                    pattern = ".", -- initialize pattern with any char
                    search = {
                        mode = function(pattern)
                            -- remove leading dot
                            if pattern:sub(1, 1) == "." then
                                pattern = pattern:sub(2)
                            end
                            -- return word pattern and proper skip pattern
                            return ([[\v<%s\w*>]]):format(pattern), ([[\v<%s]]):format(pattern)
                        end,
                    },
                    -- select the range
                    jump = { pos = "range" },
                }
            end,
            desc = "Flash Select any word",
        },
        -- use a jump label, or use ; and , to increase/decrease the selection
        {
            "S",
            mode = { "n", "o", "x" },
            function()
                require("flash").treesitter()
            end,
            desc = "Flash Treesitter",
        },
        -- operator(c,d,y) + r + search pattern + command
        -- ex yr+dej+y - start yanking, jump to de with j appearance, and yank
        {
            "r",
            mode = "o",
            function()
                require("flash").remote()
            end,
            desc = "Remote Flash",
        },
        {
            "R",
            mode = { "o", "x" },
            function()
                require("flash").treesitter_search()
            end,
            desc = "Flash Treesitter Search and show labeled treesitter nodes",
        },
        {
            "<c-s>",
            mode = { "c" },
            function()
                require("flash").toggle()
            end,
            desc = "Toggle Flash Search while using regular search",
        },
    },
}
