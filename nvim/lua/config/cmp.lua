local cmp = prequire "cmp"
if not cmp then
    return
end

local function has_words_before()
    if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then
        return false
    end
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match "%s" == nil
end

local lsp_symbols = {
    Text = "   (Text) ",
    Method = "   (Method)",
    Function = "   (Function)",
    Constructor = "   (Constructor)",
    Field = " ﴲ  (Field)",
    Variable = "[] (Variable)",
    Class = "   (Class)",
    Interface = " ﰮ  (Interface)",
    Module = "   (Module)",
    Property = " 襁 (Property)",
    Unit = "   (Unit)",
    Value = "   (Value)",
    Enum = " 練 (Enum)",
    Keyword = "   (Keyword)",
    Snippet = "   (Snippet)",
    Color = "   (Color)",
    File = "   (File)",
    Reference = "   (Reference)",
    Folder = "   (Folder)",
    EnumMember = "   (EnumMember)",
    Constant = " ﲀ  (Constant)",
    Struct = " ﳤ  (Struct)",
    Event = "   (Event)",
    Operator = "   (Operator)",
    TypeParameter = "   (TypeParameter)",
}

cmp.setup {
    confirmation = { default_behaviour = cmp.ConfirmBehavior.Replace },
    sources = {
        { name = "nvim_lsp", priority = 8 },
        { name = "cmp_tabnine", priority = 8, max_item_count = 3 },
        { name = "treesitter", priority = 7 },
        { name = "buffer", priority = 7, keyword_length = 5 },
        { name = "nvim_lua", priority = 5 },
        { name = "luasnip", priority = 5 },
        { name = "copilot", priority = 5, max_item_count = 3 },
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
        ["<cr>"] = cmp.mapping.confirm(),
        ["<C-d>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-p>"] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Select },
        ["<C-n>"] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Select },
        ["<Tab>"] = cmp.mapping(function(fallback)
            local luasnip = require "luasnip"
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            elseif has_words_before() then
                cmp.complete()
            else
                fallback()
            end
        end, { "i", "s" }),

        ["<S-Tab>"] = cmp.mapping(function(fallback)
            local luasnip = require "luasnip"
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
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
                nvim_lua = "[NLUA]",
                treesitter = "[TS]",
                path = "[Path]",
                luasnip = "[Snippet]",
                copilot = "[CoPilot]",
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
        native_menu = false,
        ghost_text = true,
    },
}
