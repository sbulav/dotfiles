return {
    {
        -- Keep around for occasional Treesitter debugging, but leave it off by default.
        "nvim-treesitter/playground",
        cmd = "TSPlaygroundToggle",
        enabled = false,
    },

    {
        "nvim-treesitter/nvim-treesitter",
        branch = "master",
        dependencies = {
            "HiPhish/rainbow-delimiters.nvim",
            "JoosepAlviste/nvim-ts-context-commentstring",
            "nvim-treesitter/nvim-treesitter-textobjects",
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
        build = ":TSUpdate",
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

            require("nvim-treesitter.configs").setup {
                ensure_installed = {
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
                    "jsonc",
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
                },
                sync_install = false,
                auto_install = true,
                highlight = {
                    enable = true,
                    additional_vim_regex_highlighting = false,
                    disable = function(_, buf)
                        local max_filesize = 512 * 1024
                        local filetype = vim.bo[buf].filetype
                        local buftype = vim.bo[buf].buftype
                        local name = vim.api.nvim_buf_get_name(buf)
                        local ok, stats = pcall(vim.loop.fs_stat, name)

                        if buftype == "prompt" or filetype == "help" or filetype == "snacks_picker_input" then
                            return true
                        end

                        return ok and stats and stats.size > max_filesize
                    end,
                },
                incremental_selection = {
                    enable = true,
                    keymaps = {
                        init_selection = "gnn",
                        node_incremental = "gni",
                        scope_incremental = "gne",
                        node_decremental = "gnd",
                    },
                },
                indent = {
                    -- FIXME: not working properly, starting newline one node higher
                    enable = false,
                },
                textobjects = {
                    select = {
                        enable = true,
                        lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
                        keymaps = {
                            -- You can use the capture groups defined in textobjects.scm
                            ["af"] = "@function.outer",
                            ["if"] = "@function.inner",
                            ["ac"] = "@class.outer",
                            ["ic"] = "@class.inner",
                        },
                    },
                    move = {
                        enable = true,
                        set_jumps = true, -- whether to set jumps in the jumplist
                        goto_next_start = {
                            ["]m"] = "@function.outer",
                            ["]]"] = "@class.outer",
                        },
                        goto_next_end = {
                            ["]M"] = "@function.outer",
                            ["]["] = "@class.outer",
                        },
                        goto_previous_start = {
                            ["[m"] = "@function.outer",
                            ["[["] = "@class.outer",
                        },
                        goto_previous_end = {
                            ["[M"] = "@function.outer",
                            ["[]"] = "@class.outer",
                        },
                    },
                },
            }
        end,
    },
}
