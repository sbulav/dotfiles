local ensure_installed = {
    "bash",
    "cmake",
    "diff",
    "dockerfile",
    "fish",
    "gitcommit",
    "gitignore",
    "go",
    "gomod",
    "gosum",
    "gowork",
    "hcl",
    "html",
    "http",
    "javascript",
    "jsdoc",
    "json",
    "lua",
    "markdown",
    "markdown_inline",
    "nix",
    "php",
    "python",
    "query",
    "regex",
    "toml",
    "tsx",
    "typescript",
    "vim",
    "vimdoc",
    "yaml",
    "terraform",
}

local function should_disable_treesitter(buf)
    local max_filesize = 512 * 1024
    local filetype = vim.bo[buf].filetype
    local buftype = vim.bo[buf].buftype
    local name = vim.api.nvim_buf_get_name(buf)
    local ok, stats = pcall(vim.uv.fs_stat, name)

    if buftype == "prompt" or filetype == "help" or filetype == "snacks_picker_input" then
        return true
    end

    return ok and stats and stats.size > max_filesize
end

local function start_treesitter(buf)
    if should_disable_treesitter(buf) then
        return
    end

    pcall(vim.treesitter.start, buf)
end

local function setup_textobjects()
    local ok, textobjects = pcall(require, "nvim-treesitter-textobjects")
    if not ok or type(textobjects.setup) ~= "function" then
        return
    end

    textobjects.setup {
        select = {
            lookahead = true,
        },
        move = {
            set_jumps = true,
        },
    }

    local select = require "nvim-treesitter-textobjects.select"
    vim.keymap.set({ "x", "o" }, "af", function()
        select.select_textobject("@function.outer", "textobjects")
    end, { desc = "Select outer function" })
    vim.keymap.set({ "x", "o" }, "if", function()
        select.select_textobject("@function.inner", "textobjects")
    end, { desc = "Select inner function" })
    vim.keymap.set({ "x", "o" }, "ac", function()
        select.select_textobject("@class.outer", "textobjects")
    end, { desc = "Select outer class" })
    vim.keymap.set({ "x", "o" }, "ic", function()
        select.select_textobject("@class.inner", "textobjects")
    end, { desc = "Select inner class" })

    local move = require "nvim-treesitter-textobjects.move"
    vim.keymap.set({ "n", "x", "o" }, "]m", function()
        move.goto_next_start("@function.outer", "textobjects")
    end, { desc = "Next function start" })
    vim.keymap.set({ "n", "x", "o" }, "]]", function()
        move.goto_next_start("@class.outer", "textobjects")
    end, { desc = "Next class start" })
    vim.keymap.set({ "n", "x", "o" }, "]M", function()
        move.goto_next_end("@function.outer", "textobjects")
    end, { desc = "Next function end" })
    vim.keymap.set({ "n", "x", "o" }, "][", function()
        move.goto_next_end("@class.outer", "textobjects")
    end, { desc = "Next class end" })
    vim.keymap.set({ "n", "x", "o" }, "[m", function()
        move.goto_previous_start("@function.outer", "textobjects")
    end, { desc = "Previous function start" })
    vim.keymap.set({ "n", "x", "o" }, "[[", function()
        move.goto_previous_start("@class.outer", "textobjects")
    end, { desc = "Previous class start" })
    vim.keymap.set({ "n", "x", "o" }, "[M", function()
        move.goto_previous_end("@function.outer", "textobjects")
    end, { desc = "Previous function end" })
    vim.keymap.set({ "n", "x", "o" }, "[]", function()
        move.goto_previous_end("@class.outer", "textobjects")
    end, { desc = "Previous class end" })
end

return {
    {
        -- Keep around for occasional Treesitter debugging, but leave it off by default.
        "nvim-treesitter/playground",
        cmd = "TSPlaygroundToggle",
        enabled = false,
    },

    {
        "nvim-treesitter/nvim-treesitter",
        branch = "main",
        dependencies = {
            "HiPhish/rainbow-delimiters.nvim",
            "JoosepAlviste/nvim-ts-context-commentstring",
            {
                "nvim-treesitter/nvim-treesitter-textobjects",
                branch = "main",
                config = setup_textobjects,
            },
            {
                "windwp/nvim-ts-autotag",
                opts = {
                    opts = {
                        enable_close = false,
                        enable_rename = true,
                        enable_close_on_slash = true,
                    },
                },
            },
        },
        lazy = false,
        build = function()
            local treesitter = require "nvim-treesitter"
            treesitter.install(ensure_installed, { summary = true }):wait(300000)
            treesitter.update(ensure_installed, { summary = true }):wait(300000)
        end,
        config = function()
            local rainbow_delimiters = require "rainbow-delimiters"

            vim.g.rainbow_delimiters = {
                strategy = {
                    [""] = rainbow_delimiters.strategy.global,
                    ["vim"] = rainbow_delimiters.strategy["local"],
                },
                query = {
                    [""] = "rainbow-delimiters",
                    lua = "rainbow-blocks",
                },
                priority = {
                    [""] = 110,
                    lua = 210,
                },
            }

            vim.treesitter.language.register("json", "jsonc")

            vim.api.nvim_create_autocmd("FileType", {
                group = vim.api.nvim_create_augroup("user_treesitter_start", { clear = true }),
                callback = function(ev)
                    start_treesitter(ev.buf)
                end,
            })

            if vim.bo.filetype ~= "" then
                start_treesitter(0)
            end
        end,
    },
}
