-- Lualine configuration (optimized)
local M = {}

-- Spinners for LSP progress
local spinners = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" }

-- Color palettes
local palettes = {
    base = {
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
    },
    cyberdream = {
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
    },
}

-- Theme definitions
local themes = {
    oceanic = {
        normal = {
            a = { fg = palettes.base.black, bg = palettes.base.navy, gui = "bold" },
            b = { fg = palettes.base.color0, bg = palettes.base.lightgrey },
            c = { fg = palettes.base.white, bg = palettes.base.bg },
        },
        insert = {
            a = { fg = palettes.base.black, bg = palettes.base.lightgreen, gui = "bold" },
            b = { fg = palettes.base.color0, bg = palettes.base.lightgrey },
            c = { fg = palettes.base.white, bg = palettes.base.bg },
        },
        visual = { a = { fg = palettes.base.black, bg = palettes.base.cyan } },
        replace = { a = { fg = palettes.base.black, bg = palettes.base.red } },
        inactive = {
            a = { fg = palettes.base.white, bg = palettes.base.black },
            b = { fg = palettes.base.white, bg = palettes.base.black },
            c = { fg = palettes.base.white, bg = palettes.base.black },
        },
    },
    cyberdream = {
        normal = {
            a = { fg = palettes.cyberdream.black, bg = palettes.cyberdream.blue, gui = "bold" },
            b = { fg = palettes.cyberdream.fg, bg = palettes.cyberdream.lightgrey },
            c = { fg = palettes.cyberdream.white, bg = palettes.cyberdream.transparent },
        },
        insert = {
            a = { fg = palettes.cyberdream.black, bg = palettes.cyberdream.green, gui = "bold" },
            b = { fg = palettes.cyberdream.fg, bg = palettes.cyberdream.lightgrey },
            c = { fg = palettes.cyberdream.white, bg = palettes.cyberdream.transparent },
        },
        visual = { a = { fg = palettes.cyberdream.black, bg = palettes.cyberdream.magenta } },
        replace = { a = { fg = palettes.cyberdream.black, bg = palettes.cyberdream.red } },
        inactive = {
            a = { fg = palettes.cyberdream.white, bg = palettes.cyberdream.transparent },
            b = { fg = palettes.cyberdream.white, bg = palettes.cyberdream.transparent },
            c = { fg = palettes.cyberdream.white, bg = palettes.cyberdream.transparent },
        },
    },
}

-- LSP progress component
local function lsp_progress(_, is_active)
    if not is_active then
        return
    end
    local msgs = vim.lsp.status()
    if #msgs == 0 then
        return ""
    end

    local parts = {}
    for _, m in ipairs(msgs) do
        local title = m.title or ""
        table.insert(parts, string.format("%d%% %s", m.percentage or 0, title))
    end

    local ms = vim.uv.hrtime() / 1e6
    local frame = math.floor(ms / 120) % #spinners + 1
    return table.concat(parts, "  ") .. " " .. spinners[frame]
end

-- LSP clients component
local function lsp_client_names()
    local names = {}
    for _, c in ipairs(vim.lsp.get_clients()) do
        table.insert(names, c.name:sub(1, 1):upper())
    end
    return #names > 0 and "[" .. table.concat(names, ":") .. "]" or "[NO_LSP]"
end

-- Simple progress and percent
local function my_progress()
    return "%l/%-3L"
end
local function my_percent()
    return "%p%%"
end

-- Auto command for LSP progress updates
vim.api.nvim_create_autocmd("User", {
    pattern = "LspProgressUpdate",
    callback = function()
        vim.opt.readonly = vim.opt.readonly
    end,
})

-- Setup function
function M.setup()
    require("lspsaga").setup {
        symbol_in_winbar = { enable = false, show_file = false, hide_keyword = true },
        beacon = { enable = false },
        lightbulb = { enable = true, sign = false },
    }

    require("lualine").setup {
        options = {
            theme = themes.cyberdream,
            globalstatus = true,
            component_separators = { left = "", right = "" },
            section_separators = { left = "", right = "" },
        },
        sections = {
            lualine_a = { "mode" },
            lualine_b = { "branch" },
            lualine_c = {
                { "filename", path = 1, symbols = { modified = "  ", readonly = "[RO]" } },
                "diff",
                {
                    function()
                        return require("lspsaga.symbol.winbar").get_bar()
                    end,
                    color = { fg = palettes.base.blue },
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
            lualine_c = { "filename" },
            lualine_y = { my_progress },
            lualine_z = { my_percent },
        },
    }
end

-- Plugin specification
return {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    dependencies = { { "nvimdev/lspsaga.nvim", event = "VeryLazy" } },
    config = M.setup,
}
