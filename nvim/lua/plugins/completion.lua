return {
    "hrsh7th/nvim-cmp",
    dependencies = {
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-nvim-lua",
        "saadparwaiz1/cmp_luasnip",
        "ray-x/cmp-treesitter",
        "hrsh7th/cmp-nvim-lsp",
        {
            "L3MON4D3/LuaSnip",
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
    event = { "InsertEnter", "CmdlineEnter" },
    config = function()
        local cmp = require "cmp"
        -- Utils
        local check_backspace = function()
            local col = vim.fn.col "." - 1
            return col == 0 or vim.fn.getline("."):sub(col, col):match "%s"
        end

        local lsp_symbols = {
            Text = "󰉿",
            Method = "󰆧",
            Function = "󰊕",
            Constructor = "",
            Field = "󰜢",
            Variable = "󰀫",
            Class = "󰠱",
            Interface = "",
            Module = "",
            Property = "󰜢",
            Unit = "󰑭",
            Value = "󰎠",
            Enum = "",
            Keyword = "󰌋",
            Snippet = "",
            Color = "󰏘",
            File = "󰈙",
            Reference = "󰈇",
            Folder = "󰉋",
            EnumMember = "",
            Constant = "󰏿",
            Struct = "󰙅",
            Event = "",
            Operator = "󰆕",
            TypeParameter = "",
        }

        cmp.setup {
            confirmation = { default_behaviour = cmp.ConfirmBehavior.Replace },
            sources = {
                { name = "nvim_lsp", priority = 8 },
                { name = "cmp_tabnine", priority = 8, max_item_count = 3 },
                { name = "treesitter", priority = 7 },
                { name = "cody", priority = 6 },
                { name = "buffer", priority = 7, keyword_length = 5 },
                { name = "nvim_lua", priority = 5 },
                { name = "luasnip", priority = 5 },
                { name = "path", priority = 4 },
            },

            sorting = {
                priority_weight = 1.0,
                comparators = {
                    cmp.config.compare.locality,
                    cmp.config.compare.recently_used,
                    cmp.config.compare.score,
                    cmp.config.compare.offset,
                    cmp.config.compare.order,
                },
            },
            mapping = {
                ["<CR>"] = cmp.mapping.confirm { select = false },
                ["<c-a>"] = cmp.mapping.complete {
                    config = {
                        sources = {
                            { name = "cody" },
                        },
                    },
                },
                ["<C-d>"] = cmp.mapping.scroll_docs(-4),
                ["<C-f>"] = cmp.mapping.scroll_docs(4),
                ["<C-p>"] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Select },
                ["<C-n>"] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Select },
                ["<C-e>"] = cmp.mapping {
                    i = cmp.mapping.abort(),
                    c = cmp.mapping.close(),
                },
                ["<Tab>"] = cmp.mapping(function(fallback)
                    local luasnip = require "luasnip"
                    if cmp.visible() then
                        cmp.select_next_item()
                    elseif luasnip.expandable() then
                        luasnip.expand()
                    elseif luasnip.expand_or_jumpable() then
                        luasnip.expand_or_jump()
                    elseif check_backspace() then
                        fallback()
                    else
                        fallback()
                    end
                end, { "i", "s" }),

                ["<S-Tab>"] = cmp.mapping(function(fallback)
                    local luasnip = require "luasnip"
                    if cmp.visible() then
                        cmp.select_next_item()
                    elseif luasnip.expandable() then
                        luasnip.expand()
                    elseif luasnip.expand_or_jumpable() then
                        luasnip.expand_or_jump()
                    elseif check_backspace() then
                        fallback()
                    else
                        fallback()
                    end
                end, { "i", "s" }),
            },
            formatting = {
                format = function(entry, item)
                    item.kind = lsp_symbols[item.kind]
                    if entry.source.name == "cmp_tabnine" then
                        item.kind = "   (TabNine)"
                        if entry.completion_item.data ~= nil and entry.completion_item.data.detail ~= nil then
                            item.kind = "   (" .. entry.completion_item.data.detail .. ")"
                        end
                    end
                    item.menu = ({
                        buffer = "[Buffer]",
                        cmp_tabnine = "[T9]",
                        nvim_lsp = "[LSP]",
                        treesitter = "[TS]",
                        cody = "[SG]",
                        path = "[Path]",
                        luasnip = "[Snippet]",
                    })[entry.source.name]
                    return item
                end,
            },
            snippet = {
                expand = function(args)
                    local luasnip = prequire "luasnip"
                    if not luasnip then
                        return
                    end
                    luasnip.lsp_expand(args.body)
                end,
            },
            window = {
                completion = {
                    border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
                    scrollbar = "║",
                    autocomplete = {
                        require("cmp.types").cmp.TriggerEvent.InsertEnter,
                        require("cmp.types").cmp.TriggerEvent.TextChanged,
                    },
                },
                documentation = {
                    border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
                    winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder",
                    scrollbar = "║",
                },
            },
            experimental = {
                ghost_text = true,
            },
        }
    end,
}
