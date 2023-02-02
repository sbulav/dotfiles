return {
    "goolord/alpha-nvim",
    dependencies = { "kyazdani42/nvim-web-devicons" },
    event = "VimEnter",
    commit = "6af3b19",
    enabled = true,
    config = function()
        local alpha = require "alpha"
        local startify = require "alpha.themes.startify"
        local function footer()
            local stats = require("lazy").stats()
            local plugins = 0
            local v = vim.version()
            local datetime = os.date " %d-%m-%Y   %H:%M:%S"
            local platform = vim.fn.has "win32" == 1 and "" or ""
            return string.format(
                "       %d   v%d.%d.%d %s  %s",
                stats.count,
                v.major,
                v.minor,
                v.patch,
                platform,
                datetime
            )
        end

        startify.section.header.val = {
            [[                                   __                ]],
            [[      ___     ___    ___   __  __ /\_\    ___ ___    ]],
            [[     / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\  ]],
            [[    /\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \ ]],
            [[    \ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\]],
            [[     \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]],
            [[-----------------------------------------------------]],
            footer(),
        }

        startify.section.bottom_buttons.val = {
            startify.button("c", "Edit init.lua", ":edit $MYVIMRC<CR>"),
            startify.button("h", "Check healthe", ":checkhealth<CR>"),
            startify.button("p", "Edit plugins", ":lua require('config.telescope_myfunctions').search_plugins()<cr>"),
            startify.button("u", "Update plugins", ":Lazy update<CR>"),
            startify.button("q", "Quit NVIM", ":qa<CR>"),
        }
        alpha.setup(startify.opts)
    end,
}
