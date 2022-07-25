-- thanks to folke
local function lsp_progress(_, is_active)
    if not is_active then
        return
    end
    local messages = vim.lsp.util.get_progress_messages()
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
    local clients = vim.lsp.buf_get_clients()
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
    lightgreen = "#99c794",
    lightgrey = "#65737e",
    navy = "#6699cc",
    cyan = "#79dac8",
    red = "#ff5189",
    white = "#c6c6c6",
    yellow = "#ECBE7B",
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

require("lualine").setup {
    options = {
        theme = oceanic_my,
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
                    local navic = require "nvim-navic"
                    return navic.get_location()
                end,
                cond = function()
                    local ok, navic = pcall(require, "nvim-navic")
                    return ok and navic.is_available() and navic.get_location() ~= ""
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
