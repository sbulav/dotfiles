return {
    "echasnovski/mini.nvim",
    version = false,
    event = "VeryLazy",
    config = function()
        require("mini.indentscope").setup {
            draw = {
                -- Delay (in ms) between event and start of drawing scope indicator
                delay = 100,

                -- animation = require("mini.indentscope").gen_animation "none",
                -- animation = nil,
            },

            -- Module mappings. Use `''` (empty string) to disable one.
            mappings = {
                -- Textobjects
                object_scope = "ii",
                object_scope_with_border = "ai",

                -- Motions (jump to respective border line; if not present - body line)
                goto_top = "[i",
                goto_bottom = "]i",
            },

            -- Options which control scope computation
            options = {
                -- Type of scope's border: which line(s) with smaller indent to
                -- categorize as border. Can be one of: 'both', 'top', 'bottom', 'none'.
                border = "both",

                -- Whether to use cursor column when computing reference indent.
                -- Useful to see incremental scopes with horizontal cursor movements.
                indent_at_cursor = true,

                -- Whether to first check input line to be a border of adjacent scope.
                -- Use it if you want to place cursor on function header to get scope of
                -- its body.
                try_as_border = true,
            },

            -- Which character to use for drawing scope indicator
            symbol = "╎",
        }

        local hipatterns = require "mini.hipatterns"
        hipatterns.setup {
            highlighters = {
                -- Highlight standalone 'FIXME', 'HACK', 'TODO', 'NOTE'
                fixme = { pattern = "%f[%w]()FIXME()%f[%W]", group = "lualine_a_visual" },
                hack = { pattern = "%f[%w]()HACK()%f[%W]", group = "lualine_a_replace" },
                todo = { pattern = "%f[%w]()TODO()%f[%W]", group = "lualine_a_normal" },
                note = { pattern = "%f[%w]()NOTE()%f[%W]", group = "lualine_a_normal" },

                -- Highlight hex color strings (`#rrggbb`) using that color
                hex_color = hipatterns.gen_highlighter.hex_color(),
            },
        }

        require("mini.splitjoin").setup {
            -- Module mappings. Use `''` (empty string) to disable one.
            -- Created for both Normal and Visual modes.
            mappings = {
                toggle = "gJ",
                split = "",
                join = "",
            },
        }
        require("mini.comment").setup {
            options = {
                -- https://github.com/JoosepAlviste/nvim-ts-context-commentstring/wiki/Integrations#minicomment
                custom_commentstring = function()
                    return require("ts_context_commentstring").calculate_commentstring() or vim.bo.commentstring
                end,
                ignore_blank_line = true,
                -- Whether to recognize as comment only lines without indent
                start_of_line = false,
                -- Whether to force single space inner padding for comment parts
                pad_comment_parts = true,
            },

            mappings = {
                -- Toggle comment (like `gcip` - comment inner paragraph) for both
                -- Normal and Visual modes
                comment = "gc",

                -- Toggle comment on current line
                comment_line = "gcc",

                -- Toggle comment on visual selection
                comment_visual = "gc",

                -- Define 'comment' textobject (like `dgc` - delete whole comment block)
                -- Works also in Visual mode if mapping differs from `comment_visual`
                textobject = "gc",
            },
        }
        require("mini.surround").setup {
            -- Duration (in ms) of highlight when calling `MiniSurround.highlight()`
            highlight_duration = 900,

            -- Number of lines within which surrounding is searched
            n_lines = 50,
        }
        require("mini.trailspace").setup()
        require("mini.icons").setup()
    end,
}
