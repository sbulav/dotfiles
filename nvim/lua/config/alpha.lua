local alpha = prequire("alpha")
if not alpha then
    return
end

local startify = require'alpha.themes.startify'

startify.section.header.val = {
    [[                                   __                ]],
    [[      ___     ___    ___   __  __ /\_\    ___ ___    ]],
    [[     / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\  ]],
    [[    /\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \ ]],
    [[    \ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\]],
    [[     \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]],
    [[-----------------------------------------------------]],
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
    startify.button( "c", "Edit init.lua" , ":edit $MYVIMRC<CR>"),
    startify.button( "u", "Update packages" , ":PackerSync<CR>"),
    startify.button( "q", "Quit NVIM" , ":qa<CR>"),
}
startify.section.footer = {
    { type = "text", val = "footer" },
}

alpha.setup(startify.opts)
