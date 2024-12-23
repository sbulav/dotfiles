local function footer()
    local v = vim.version()
    local datetime = os.date " %d-%m-%Y   %H:%M:%S"
    local platform = vim.fn.has "win32" == 1 and "" or ""
    return string.format(" v%d.%d.%d %s  %s", v.major, v.minor, v.patch, platform, datetime)
end

return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
        bigfile = { enabled = true },
        dashboard = { -- {{{
            enabled = true,
            preset = {
                header = [[
                                   __                
      ___     ___    ___   __  __ /\_\    ___ ___    
     / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\  
    /\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \ 
    \ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\
     \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/
-----------------------------------------------------
                ]],

                keys = {
                    { icon = " ", key = "e", desc = "New File", action = ":ene | startinsert" },
                    { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
                    {
                        icon = " ",
                        key = "g",
                        desc = "Live grep",
                        action = ":lua Snacks.dashboard.pick('live_grep')",
                    },
                    {
                        icon = " ",
                        key = "h",
                        desc = "History",
                        action = ":lua Snacks.dashboard.pick('oldfiles')",
                    },
                    {
                        icon = " ",
                        key = "c",
                        desc = "Edit init.lua",
                        action = ":edit $MYVIMRC",
                    },
                    { icon = "󰓙 ", key = "H", desc = "Check health", action = ":checkhealth" },
                    { icon = " ", key = "u", desc = "Update plugins", action = ":Lazy update" },
                    { icon = " ", key = "q", desc = "Quit NVIM", action = ":qa" },
                },
            },
            formats = {
                key = function(item)
                    return { { "[", hl = "special" }, { item.key, hl = "key" }, { "]", hl = "special" } }
                end,
            },
            sections = {
                { section = "header", align = "center", padding = 0.1 },
                { text = footer(), align = "center", padding = 0.1 },
                { section = "startup", icon = "", align = "center", padding = 0.1 },
                { title = "MRU", padding = 1 },
                { section = "recent_files", limit = 8, padding = 1 },
                { title = "MRU ", file = vim.fn.fnamemodify(".", ":~"), padding = 1 },
                { section = "recent_files", cwd = true, limit = 8, padding = 1 },
                { text = "------------------------------------------------------------", padding = 1 },
                { section = "keys" },
            },
        }, -- }}}
        indent = { enabled = false },
        input = { enabled = false },
        quickfile = { enabled = false },
        scroll = { enabled = false },
        statuscolumn = { enabled = false },
        words = { enabled = false },
        notifier = { -- {{{
            enabled = true,
            timeout = 2000,
            width = { min = 40, max = 0.4 },
            height = { min = 1, max = 0.6 },
            -- editor margin to keep free. tabline and statusline are taken into account automatically
            margin = { top = 0, right = 1, bottom = 0 },
            padding = true, -- add 1 cell of left/right padding to the notification window
            sort = { "level", "added" }, -- sort by level and time
            -- minimum log level to display. TRACE is the lowest
            -- all notifications are stored in history
            level = vim.log.levels.TRACE,
            icons = {
                error = " ",
                warn = " ",
                info = " ",
                debug = " ",
                trace = " ",
            },
            keep = function(notif)
                return vim.fn.getcmdpos() > 0
            end,
            ---@type snacks.notifier.style
            style = "fancy",
            top_down = true, -- place notifications from top to bottom
            date_format = "%R", -- time format for notifications
            refresh = 50, -- refresh at most every 50ms

            -- LSP progress notification
            vim.api.nvim_create_autocmd("LspProgress", {
                ---@param ev {data: {client_id: integer, params: lsp.ProgressParams}}
                callback = function(ev)
                    local spinner = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" }
                    vim.notify(vim.lsp.status(), "info", {
                        id = "lsp_progress",
                        title = "LSP Progress",
                        opts = function(notif)
                            notif.icon = ev.data.params.value.kind == "end" and " "
                                or spinner[math.floor(vim.uv.hrtime() / (1e6 * 80)) % #spinner + 1]
                        end,
                    })
                end,
            }),
            vim.api.nvim_create_user_command("Notifications", function()
                Snacks.notifier.show_history()
            end, {
                nargs = 0,
            }),
        }, -- }}}
    },
}
