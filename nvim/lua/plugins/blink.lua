return {
    {

        "saghen/blink.cmp",
        lazy = false, -- lazy loading handled internally
        -- build = "nix run .#build-plugin",
        version = "v0.8.*",
        dependencies = {
            -- add blink.compat
            {
                "saghen/blink.compat",
                -- use the latest release, via version = '*', if you also use the latest release for blink.cmp
                version = "*",
                -- lazy.nvim will automatically load the plugin when it's required by blink.cmp
                lazy = true,
                -- make sure to set opts so that lazy.nvim calls blink.compat's setup
                opts = {},
            },
            {
                "L3MON4D3/LuaSnip",
                version = "v2.*",
                config = function()
                    require("luasnip").config.setup {
                        updateevents = "TextChanged,TextChangedI",
                        store_selection_keys = "<Tab>",
                    }
                    require "config.snippets"
                end,
            },

            {
                "tzachar/cmp-tabnine",
                build = "./install.sh",
                config = function()
                    require("cmp_tabnine.config"):setup {
                        max_lines = 1000,
                        max_num_results = 20,
                        sort = true,
                        run_on_every_keystroke = true,
                        snippet_placeholder = "..",
                        ignored_file_types = { -- default is not to ignore
                            -- uncomment to ignore in lua:
                            -- lua = true
                        },
                        show_prediction_strength = true,
                    }
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
            sources = {
                default = { "lsp", "tabnine", "path", "luasnip", "buffer" },
                cmdline = {}, -- do not complete in cmdline
                providers = {
                    tabnine = {
                        name = "cmp_tabnine",
                        module = "blink.compat.source",
                        score_offset = 100,
                        async = true,
                    },
                },
            },
            completion = {
                list = {
                    selection = "preselect",
                },
                menu = {
                    border = "rounded",
                    min_width = 20,
                    draw = {
                        align_to_component = "kind_icon", -- or 'none' to disable
                        padding = { 1, 0 },
                        columns = {
                            { "label", "label_description", gap = 1 },
                            { "kind_icon", gap = 1 },
                        },
                        components = {
                            label = { width = { fill = true } }, -- default is true
                            label_description = { width = { fill = true } },
                            kind_icon = {
                                --   ellipsis: whether to add an ellipsis when truncating the text
                                ellipsis = false,
                                width = { fill = true },
                                text = function(ctx)
                                    local kind_icon, _, _ = require("mini.icons").get("lsp", ctx.kind)
                                    source_formatted = ({
                                        Buffer = "[Buffer]",
                                        cmp_tabnine = "[T9]",
                                        LSP = "[LSP]",
                                        TreeSitter = "[TS]",
                                        Path = "[Path]",
                                        Luasnip = "[Snippet]",
                                    })[ctx.item.source_name]

                                    return kind_icon .. " " .. source_formatted
                                end,
                                -- Optionally, you may also use the highlights from mini.icons
                                highlight = function(ctx)
                                    local _, hl, _ = require("mini.icons").get("lsp", ctx.kind)
                                    return hl
                                end,
                            },
                        },
                    },
                },

                -- experimental auto-brackets support
                accept = {
                    auto_brackets = { enabled = true },
                },

                documentation = {
                    window = {
                        border = "rounded",
                    },
                    auto_show = true,
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
        -- allows extending the enabled_providers array elsewhere in your config
        -- without having to redefine it
        opts_extend = { "sources.default" },
    },
}
