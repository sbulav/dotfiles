local alpha = prequire "alpha"
if not alpha then
    return
end

local startify = require "alpha.themes.startify"
local function footer()
    local plugins = #vim.tbl_keys(packer_plugins)
    local v = vim.version()
    local datetime = os.date " %d-%m-%Y   %H:%M:%S"
    local platform = vim.fn.has "win32" == 1 and "" or ""
    return string.format("       %d   v%d.%d.%d %s  %s", plugins, v.major, v.minor, v.patch, platform, datetime)
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

--[[ startify.section.top_buttons.val = {
    startify.button( "e", "  New file" , ":ene <BAR> startinsert <CR>"),
}
-- disable MRU
startify.section.mru.val = { { type = "padding", val = 9 } }
-- disable MRU cwd
startify.section.mru_cwd.val = { { type = "padding", val = 9 } }
-- disable nvim_web_devicons
startify.nvim_web_devicons.enabled = true
-- startify.nvim_web_devicons.highlight = false
-- startify.nvim_web_devicons.highlight = 'Keyword'
--]]
startify.section.bottom_buttons.val = {
    startify.button("c", "Edit init.lua", ":edit $MYVIMRC<CR>"),
    startify.button("p", "Edit packages.lua", ":edit ~/dotfiles/nvim/lua/packages.lua<CR>"),
    startify.button("u", "Update packages", ":PackerSync<CR>"),
    startify.button("q", "Quit NVIM", ":qa<CR>"),
}

alpha.setup(startify.opts)
