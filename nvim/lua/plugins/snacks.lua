local function footer()
    local v = vim.version()
    local datetime = os.date " %d-%m-%Y   %H:%M:%S"
    local platform = vim.fn.has "win32" == 1 and "" or ""
    return string.format(" v%d.%d.%d %s  %s", v.major, v.minor, v.patch, platform, datetime)
end

local mappings = {
    -- Grep
    -- {{{
    {
        "<leader>fA",
        function()
            Snacks.picker.grep()
        end,
        desc = "Grep",
    },
    {
        "<leader>fg",
        function()
            Snacks.picker.lines()
        end,
        desc = "Gref in current Buffer",
    },
    {
        "<leader>fa",
        function()
            Snacks.picker.grep { cwd = vim.fn.expand "%:p:h" }
        end,
        desc = "Grep in Current Directory",
    },
    {
        "<leader>fr",
        function()
            Snacks.picker.grep { cwd = Snacks.git.get_root(path) }
        end,
        desc = "Grep in Git root",
    }, -- }}}
    -- Git
    -- {{{
    {
        "<leader>gf",
        function()
            Snacks.picker.git_files()
        end,
        desc = "Find Files (git-files)",
    },
    {
        "<leader>gl",
        function()
            Snacks.picker.git_log()
        end,
        desc = "Git Log",
    },
    {
        "<leader>gs",
        function()
            Snacks.picker.git_status()
        end,
        desc = "Git Status",
    }, -- }}}
    -- Find
    -- {{{
    {
        "<leader>fv",
        function()
            Snacks.picker.files { cwd = "$HOME/dotfiles/nvim" }
        end,
        desc = "Find Vimfiles",
    },
    {
        "<leader>fn",
        function()
            Snacks.picker.files { cwd = "$HOME/dotnix" }
        end,
        desc = "Find Nixfiles",
    },
    {
        "<leader>fF",
        function()
            Snacks.picker.files()
        end,
        desc = "Find Files",
    },
    {
        "<leader>ff",
        function()
            Snacks.picker.files { cwd = vim.fn.expand "%:p:h" }
        end,
        desc = "Find In Current Directory",
    },
    {
        "<leader>fh",
        function()
            Snacks.picker.recent()
        end,
        desc = "Recent",
    },
    {
        "<leader>fb",
        function()
            Snacks.picker.buffers()
        end,
        desc = "Buffers",
    }, -- }}}
    -- Search other
    -- {{{
    {
        "<leader>fc",
        function()
            Snacks.picker.commands()
        end,
        desc = "Commands",
    },
    {
        "<leader>fd",
        function()
            Snacks.picker.diagnostics()
        end,
        desc = "Diagnostics",
    },
    {
        "<leader>ft",
        function()
            Snacks.picker.help()
        end,
        desc = "Help Pages",
    },
    {
        "<leader>fm",
        function()
            Snacks.picker.keymaps()
        end,
        desc = "Keymaps",
    },
    {
        "<leader>fM",
        function()
            Snacks.picker.marks()
        end,
        desc = "Marks",
    }, -- }}}
}
return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    keys = mappings,
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
        quickfile = { enabled = true },
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
        picker = {
            ui_select = true, -- replace `vim.ui.select` with the snacks picker

            layout = { preset = "telescope", reverse = true },
            win = {
                -- input window
                input = {
                    keys = {
                        ["<Esc>"] = "close",
                        -- to close the picker on ESC instead of going to normal mode,
                        -- add the following keymap to your config
                        -- ["<Esc>"] = { "close", mode = { "n", "i" } },
                        ["<CR>"] = "confirm",
                        ["G"] = "list_bottom",
                        ["gg"] = "list_top",
                        ["j"] = "list_down",
                        ["k"] = "list_up",
                        ["/"] = "toggle_focus",
                        ["q"] = "close",
                        ["c-q"] = "close",
                        ["?"] = "toggle_help",
                        ["<a-d>"] = { "inspect", mode = { "n", "i" } },
                        ["<c-a>"] = { "select_all", mode = { "n", "i" } },
                        ["<a-m>"] = { "toggle_maximize", mode = { "i", "n" } },
                        ["<a-p>"] = { "toggle_preview", mode = { "i", "n" } },
                        ["<a-w>"] = { "cycle_win", mode = { "i", "n" } },
                        ["<C-w>"] = { "<c-s-w>", mode = { "i" }, expr = true, desc = "delete word" },
                        ["<C-Up>"] = { "history_back", mode = { "i", "n" } },
                        ["<C-Down>"] = { "history_forward", mode = { "i", "n" } },
                        ["<Tab>"] = { "select_and_next", mode = { "i", "n" } },
                        ["<S-Tab>"] = { "select_and_prev", mode = { "i", "n" } },
                        ["<Down>"] = { "list_down", mode = { "i", "n" } },
                        ["<Up>"] = { "list_up", mode = { "i", "n" } },
                        ["<c-j>"] = { "list_down", mode = { "i", "n" } },
                        ["<c-k>"] = { "list_up", mode = { "i", "n" } },
                        ["<c-n>"] = { "list_down", mode = { "i", "n" } },
                        ["<c-p>"] = { "list_up", mode = { "i", "n" } },
                        ["<c-u>"] = { "preview_scroll_up", mode = { "i", "n" } },
                        ["<c-d>"] = { "preview_scroll_down", mode = { "i", "n" } },
                        ["<PageUp>"] = { "list_scroll_up", mode = { "i", "n" } },
                        ["<PageDown>"] = { "list_scroll_down", mode = { "i", "n" } },
                        ["<c-g>"] = { "toggle_live", mode = { "i", "n" } },
                        ["<c-v>"] = { "edit_vsplit", mode = { "i", "n" } },
                        ["<c-s>"] = { "edit_split", mode = { "i", "n" } },
                        ["<c-q>"] = { "qflist", mode = { "i", "n" } },
                        ["<a-i>"] = { "toggle_ignored", mode = { "i", "n" } },
                        ["<a-.>"] = { "toggle_hidden", mode = { "i", "n" } },
                    },
                },
                -- result list window
                list = {
                    keys = {
                        ["<CR>"] = "confirm",
                        ["gg"] = "list_top",
                        ["G"] = "list_bottom",
                        ["i"] = "focus_input",
                        ["j"] = "list_down",
                        ["k"] = "list_up",
                        ["q"] = "close",
                        ["Q"] = "close",
                        ["<Tab>"] = "select_and_next",
                        ["<S-Tab>"] = "select_and_prev",
                        ["<Down>"] = "list_down",
                        ["<Up>"] = "list_up",
                        ["<a-d>"] = "inspect",
                        ["<c-u>"] = { "preview_scroll_up", mode = { "i", "n" } },
                        ["<c-d>"] = { "preview_scroll_down", mode = { "i", "n" } },
                        ["<PageUp>"] = { "list_scroll_up", mode = { "i", "n" } },
                        ["<PageDown>"] = { "list_scroll_down", mode = { "i", "n" } },
                        ["/"] = "toggle_focus",
                        ["<c-a>"] = "select_all",
                        ["<c-v>"] = "edit_vsplit",
                        ["<c-s>"] = "edit_split",
                        ["<c-j>"] = "list_down",
                        ["<c-k>"] = "list_up",
                        ["<c-n>"] = "list_down",
                        ["<c-p>"] = "list_up",
                        ["<a-w>"] = "cycle_win",
                        ["<Esc>"] = "close",
                    },
                },
                -- preview window
                preview = {
                    keys = {
                        ["<Esc>"] = "close",
                        ["q"] = "close",
                        ["Q"] = "close",
                        ["i"] = "focus_input",
                        ["<a-w>"] = "cycle_win",
                    },
                },
            },
        },
    },
}
