-- Lualine configuration (optimized)
local M = {}

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

-- Setup function
function M.setup()
    require("lualine").setup {
        options = {
            theme = "cyberdream",
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
            },
            lualine_x = {
                lsp_client_names,
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
    config = M.setup,
}
