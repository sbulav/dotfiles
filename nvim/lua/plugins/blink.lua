return {
    {
        "saghen/blink.cmp",
        event = "InsertEnter",
        version = "v1.9.1",
        dependencies = {
            {
                "L3MON4D3/LuaSnip",
                version = "v2.4.1",
                event = "InsertEnter",
                config = function()
                    require "config.snippets"
                end,
            },
        },
        ---@module 'blink.cmp'
        opts = {
            keymap = {
                ["<C-e>"] = { "hide", "fallback" },
                ["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
                ["<CR>"] = { "accept", "fallback" },
                ["<C-p>"] = { "select_prev", "fallback" },
                ["<C-n>"] = { "select_next", "fallback" },
                ["<C-u>"] = { "scroll_documentation_up", "fallback" },
                ["<C-d>"] = { "scroll_documentation_down", "fallback" },
                ["<S-Tab>"] = { "select_prev", "snippet_backward", "fallback" },
                ["<Tab>"] = { "select_next", "snippet_forward", "fallback" },
            },
            snippets = {
                preset = "luasnip",
                expand = function(snippet)
                    require("luasnip").lsp_expand(snippet)
                end,
                active = function(filter)
                    if filter and filter.direction then
                        return require("luasnip").jumpable(filter.direction)
                    end
                    return require("luasnip").in_snippet()
                end,
                jump = function(direction)
                    require("luasnip").jump(direction)
                end,
            },
            enabled = function()
                return not vim.tbl_contains({ "typr", "snacks_picker_input" }, vim.bo.filetype)
                    and vim.bo.buftype ~= "prompt"
                    and vim.b.completion ~= false
            end,
            cmdline = {
                enabled = false,
            },
            sources = {
                default = { "lsp", "path", "snippets", "buffer" },
            },
            completion = {
                list = {
                    selection = {
                        preselect = true,
                        auto_insert = false,
                    },
                },
                menu = {
                    border = "rounded",
                    min_width = 20,
                    draw = {
                        columns = {
                            { "label", "label_description", gap = 1 },
                            { "kind_icon", "kind", gap = 1 },
                            { "source_name" },
                        },
                        components = {
                            source_name = {
                                text = function(ctx)
                                    local names = {
                                        buffer = "[Buffer]",
                                        lsp = "[LSP]",
                                        path = "[Path]",
                                        snippets = "[Snippet]",
                                        lazydev = "[Lua]",
                                    }

                                    return names[ctx.source_id] or ("[" .. ctx.source_name .. "]")
                                end,
                            },
                        },
                    },
                },
                accept = {
                    auto_brackets = { enabled = true },
                },
                documentation = {
                    window = {
                        border = "rounded",
                    },
                    auto_show = true,
                    auto_show_delay_ms = 300,
                },
                ghost_text = {
                    enabled = true,
                },
            },
            signature = {
                window = {
                    border = "rounded",
                },
                enabled = true,
            },
        },
        opts_extend = { "sources.default" },
    },
}
