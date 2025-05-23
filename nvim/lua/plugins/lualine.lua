local function lsp_progress(_, is_active)
    if not is_active then
        return
    end
    local messages = vim.lsp.status()
    if #messages == 0 then
        return ""
    end
    local status = {}
    for _, msg in pairs(messages) do
        local title = ""
        if msg.title then
            title = msg.title
        end
        table.insert(status, (msg.percentage or 0) .. "%% " .. title)
    end
    local spinners = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" }
    local ms = vim.loop.hrtime() / 1000000
    local frame = math.floor(ms / 120) % #spinners
    return table.concat(status, "  ") .. " " .. spinners[frame + 1]
end

local function lsp_client_names()
    -- Get all active clients in the buffer
    local clients = vim.lsp.get_clients()
    local client_names = "["

    for _, client in pairs(clients) do
        client_names = client_names .. string.upper(string.sub(client.name, 1, 1)) .. ":"
    end
    if string.len(client_names) > 1 then
        return string.gsub(client_names, ".$", "]")
    else
        return "[NO_LSP]"
    end
end

vim.cmd "au User LspProgressUpdate let &ro = &ro"

local function my_progress()
    return "%l/%-3L"
end

local function my_percent()
    return "%p%%"
end

-- local function my_paste()
--     return "%{&paste?' PASTE ':''}"
-- end

local colors = {
    -- bg = require("lualine.utils.utils").extract_highlight_colors("Normal", "bg"),
    bg = "#1b2b34",
    black = "#080808",
    blue = "#80a0ff",
    color0 = "#ffffff",
    cyan = "#79dac8",
    lightgreen = "#99c794",
    lightgrey = "#65737e",
    navy = "#6699cc",
    red = "#ff5189",
    white = "#c6c6c6",
    yellow = "#ECBE7B",
}

local colorscyberdream = {
    bg = "#16181a",
    bgAlt = "#1e2124",
    bgHighlight = "#3c4048",
    black = "#080808",
    blue = "#5ea1ff",
    cyan = "#5ef1ff",
    fg = "#ffffff",
    green = "#5eff6c",
    grey = "#7b8496",
    lightblue = "#bbd3ff",
    lightgrey = "#65737e",
    magenta = "#ff5ef1",
    navy = "#6699cc",
    orange = "#ffbd5e",
    pink = "#ff5ea0",
    purple = "#bd5eff",
    red = "#ff6e5e",
    white = "#c6c6c6",
    yellow = "#f1ff5e",
    transparent = "#000000",
}

local oceanic_my = {
    normal = {
        a = { fg = colors.black, bg = colors.navy, gui = "bold" },
        b = { fg = colors.color0, bg = colors.lightgrey },
        c = { fg = colors.white, bg = colors.bg },
    },
    insert = {
        a = { fg = colors.black, bg = colors.lightgreen, gui = "bold" },
        b = { fg = colors.color0, bg = colors.lightgrey },
        c = { fg = colors.white, bg = colors.bg },
    },
    visual = { a = { fg = colors.black, bg = colors.cyan } },
    replace = { a = { fg = colors.black, bg = colors.red } },

    inactive = {
        a = { fg = colors.white, bg = colors.black },
        b = { fg = colors.white, bg = colors.black },
        c = { fg = colors.white, bg = colors.black },
    },
}

local cyberdream_my = {
    normal = {
        a = { fg = colorscyberdream.black, bg = colorscyberdream.blue, gui = "bold" },
        b = { fg = colorscyberdream.fg, bg = colorscyberdream.lightgrey },
        c = { fg = colorscyberdream.white, bg = colorscyberdream.transparent },
    },
    insert = {
        a = { fg = colorscyberdream.black, bg = colorscyberdream.green, gui = "bold" },
        b = { fg = colorscyberdream.fg, bg = colorscyberdream.lightgrey },
        c = { fg = colorscyberdream.white, bg = colorscyberdream.transparent },
    },
    visual = { a = { fg = colorscyberdream.black, bg = colorscyberdream.magenta } },
    replace = { a = { fg = colorscyberdream.black, bg = colorscyberdream.red } },

    inactive = {
        a = { fg = colorscyberdream.white, bg = colorscyberdream.transparent },
        b = { fg = colorscyberdream.white, bg = colorscyberdream.transparent },
        c = { fg = colorscyberdream.white, bg = colorscyberdream.transparent },
    },
}

return {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    dependencies = { -- Show current code context
        {
            "nvimdev/lspsaga.nvim",
            event = "VeryLazy",
            config = function()
                require("lspsaga").setup {
                    symbol_in_winbar = {
                        enable = false,
                        show_file = false,
                        hide_keyword = true,
                    },
                    beacon = {
                        enable = false,
                    },
                    lightbulb = {
                        enable = true,
                        sign = false,
                    },
                }
            end,
        },
    },

    config = function()
        require("lualine").setup {
            options = {
                theme = cyberdream_my,
                globalstatus = true,
                component_separators = { left = "", right = "" },
                section_separators = { left = "", right = "" },
            },

            sections = {
                lualine_a = { "mode" },
                lualine_b = { "branch" },
                lualine_c = {
                    { "filename", path = 1, symbols = { modified = "  ", readonly = "[RO]" } },
                    { "diff" },
                    {
                        function()
                            return require("lspsaga.symbol.winbar").get_bar()
                        end,
                        color = { fg = colors.blue },
                    },
                },
                lualine_x = {
                    lsp_client_names,
                    lsp_progress,
                    { "diagnostics", sources = { "nvim_diagnostic" } },
                    "filetype",
                },
                lualine_y = { my_progress },
                lualine_z = { my_percent },
            },
            inactive_sections = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = { "filename" },
                lualine_x = {},
                lualine_y = { my_progress },
                lualine_z = { my_percent },
            },
            extensions = {},
        }
    end,
}
