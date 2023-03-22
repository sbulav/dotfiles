return {
    { "nvim-treesitter/playground", cmd = "TSPlaygroundToggle" },

    {
        "nvim-treesitter/nvim-treesitter",
        dependencies = {
            "HiPhish/nvim-ts-rainbow2",
            "JoosepAlviste/nvim-ts-context-commentstring",
        },
        cmd = { "TSUpdate" },
        event = "BufRead",
        build = function()
            require("nvim-treesitter.install").update { with_sync = true }
        end,
        config = function()
            require("nvim-treesitter.configs").setup {
                ensure_installed = {
                    "bash",
                    "cmake",
                    -- "comment", -- comments are slowing down TS bigtime, so disable for now
                    "diff",
                    "fish",
                    "gitignore",
                    "go",
                    "help",
                    "html",
                    "http",
                    "javascript",
                    "jsdoc",
                    "jsonc",
                    "lua",
                    "markdown",
                    "markdown_inline",
                    "php",
                    "python",
                    "query",
                    "regex",
                    "toml",
                    "typescript",
                    "vim",
                    "yaml",
                    "json",
                    "dockerfile",
                    "terraform",
                },
                sync_install = false,
                auto_install = true,
                highlight = {
                    enable = true, -- false will disable the whole extension
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
                    enable = true,
                },
                rainbow = {
                    enable = true,
                    extended_mode = true,
                    max_file_lines = 1500,
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
