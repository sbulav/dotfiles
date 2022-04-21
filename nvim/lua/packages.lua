-- load packer
local packer = prequire "config.packer"

if not packer then
    return
end

packer.startup(function(use)
    -- Packer plugin manager
    use { "wbthomason/packer.nvim" }

    -- Interface plugins
    -- Statusline in Lua
    use {
        "nvim-lualine/lualine.nvim",
        config = function()
            require "config.lualine"
        end,
    }
    -- Notifications in popup window
    use {
        "rcarriga/nvim-notify",
        event = "VimEnter",
        config = function()
            vim.notify = require "notify"
            require "config.notify"
        end,
    }
    -- Startup screen
    use {
        "goolord/alpha-nvim",
        requires = { "kyazdani42/nvim-web-devicons" },
        config = function()
            require "config.alpha"
        end,
    }
    -- Redirect output to scratch buffer
    use {
        "sbulav/nredir.nvim",
    }
    -- Smart handling of terminal
    use {
        "akinsho/toggleterm.nvim",
        config = function()
            require "config.toggleterm"
        end,
    }

    -- Indentation highlights
    use {
        "lukas-reineke/indent-blankline.nvim",
        config = function()
            require("indent").setup()
        end,
    }
    -- use { "glepnir/indent-guides.nvim" } -- Indentation highlighs
    -- Easymotion in Lua
    use {
        "phaazon/hop.nvim",
        config = function()
            require "config.hop"
        end,
    }
    -- Commentary
    use {
        "numToStr/Comment.nvim",
        config = function()
            require("Comment").setup()
        end,
    }
    -- Speed up filetype detection
    -- Included in nvim0.7, not enabled by default
    use {
        "nathom/filetype.nvim",
        config = function()
            require("filetype").setup {
                overrides = {
                    literal = {
                        ["kitty.conf"] = "kitty",
                        [".gitignore"] = "conf",
                    },
                    complex = {
                        [".clang*"] = "yaml",
                        [".*%.env.*"] = "sh",
                        [".*ignore"] = "conf",
                        [".*enkinsfile.*"] = "groovy",
                    },
                    extensions = {
                        fish = "fish",
                        tf = "terraform",
                        tfvars = "terraform",
                        tfstate = "json",
                        eslintrc = "json",
                        prettierrc = "json",
                        mdx = "markdown",
                    },
                },
            }
        end,
    }
    use { "tpope/vim-eunuch" } -- Integration with UNIX shell
    use { "machakann/vim-sandwich" } -- Surround objects with any character e.g. saiw|sdb|srb"
    use { "romainl/vim-qf" } -- Better work with quickfix
    use { "mbbill/undotree" } -- Undotree
    ---
    use { -- Telescope fuzzy finder
        "nvim-telescope/telescope.nvim",
        requires = {
            { "nvim-lua/popup.nvim" },
            { "nvim-lua/plenary.nvim" },
            { "nvim-telescope/telescope-github.nvim" },
            { "kosayoda/nvim-lightbulb" },
            { "ANGkeith/telescope-terraform-doc.nvim" },
            -- { "/Users/sab/git_priv/telescope-github.nvim" },
            -- { "/Users/sab/git_priv/telescope-terraform.nvim" },
            -- { "LinArcX/telescope-env.nvim" },
            -- { "nvim-telescope/telescope-project.nvim" },
            -- { "sbulav/telescope-terraform.nvim" },
            -- {'nvim-telescope/telescope-frecency.nvim'}, -- media preview
            -- {'nvim-telescope/telescope-fzy-native.nvim'}, -- fast finder
            -- {'nvim-telescope/telescope-media-files.nvim'}, -- media preview
        },
        config = function()
            require "config.telescope"
        end,
    }
    --- Treesitter
    --- better text highlighting
    use {
        "nvim-treesitter/nvim-treesitter",
        -- event = "BufRead",
        config = function()
            require "config.treesitter"
        end,
        run = ":TSUpdate",
    }

    -- Parenthesis highlighting
    use {
        "p00f/nvim-ts-rainbow",
        after = "nvim-treesitter",
    }
    -- use 'nvim-treesitter/playground'
    use { -- Tree file manager
        "kyazdani42/nvim-tree.lua",
        requires = {
            { "kyazdani42/nvim-web-devicons" },
        },
        config = function()
            require "config.nvim-tree"
        end,
    }
    -- prevent select and visual mode from overwriting the clipboard
    use {
        "kevinhwang91/nvim-hclipboard",
        event = "InsertCharPre",
        config = function()
            require("hclipboard").start()
        end,
    }

    -- Version Control Plugins
    use {
        "lewis6991/gitsigns.nvim",
        requires = {
            "nvim-lua/plenary.nvim",
        },
        config = function()
            require("gitsigns").setup()
        end,
        -- tag = 'release' -- To use the latest release
    }
    use { "tpope/vim-fugitive" } -- Git combine

    use { "ckipp01/nvim-jenkinsfile-linter", requires = { "nvim-lua/plenary.nvim" } }

    -- Code display
    use { "sbulav/base16" } --base16 colorchemes

    -- Lua
    use { "tjdevries/nlua.nvim" }
    use { "euclidianAce/BetterLua.vim" }

    -- Tests
    use { "janko/vim-test" }

    -- completion engine
    use {
        "hrsh7th/nvim-cmp",
        event = "BufRead",
        requires = {
            { "hrsh7th/cmp-buffer", after = "nvim-cmp" },
            { "hrsh7th/cmp-path", after = "nvim-cmp" },
            { "hrsh7th/cmp-nvim-lua", after = "nvim-cmp" },
            { "hrsh7th/cmp-nvim-lsp", after = "nvim-cmp" },
            { "saadparwaiz1/cmp_luasnip", after = "LuaSnip" },
            { "ray-x/cmp-treesitter", after = "LuaSnip" },
        },
        config = function()
            require "config.cmp"
        end,
    }

    -- tabnine AI Assistant
    use {
        "tzachar/cmp-tabnine",
        after = "nvim-cmp",
        run = "./install.sh",
        config = function()
            require "config.cmp_tabnine"
        end,
    }
    -- Github copilot
    use {
        "zbirenbaum/copilot.lua",
        after = "nvim-cmp",
        -- event = "InsertEnter",
        config = function()
            vim.schedule(function()
                require("copilot").setup {
                    ft_disable = { "markdown" },
                }
            end)
        end,
    }
    use {
        "zbirenbaum/copilot-cmp",
        after = { "copilot.lua", "nvim-cmp" },
    }

    -- snippets
    use {
        "L3MON4D3/LuaSnip",
        after = "nvim-cmp",
        config = function()
            require "config.snippets"
        end,
    }
    -- LSP
    -- lsp configuration
    use {
        "neovim/nvim-lspconfig",
        after = "cmp-nvim-lsp",
        config = function()
            require "lsp"
        end,
    }
    use {
        "jose-elias-alvarez/null-ls.nvim",
        after = "nvim-lspconfig",
        config = function()
            require "lsp.null-ls"
        end,
    }

    -- great ui for lsp
    use {
        "tami5/lspsaga.nvim",
        after = "nvim-lspconfig",
        config = function()
            require "config.saga"
        end,
    }

    use {
        "kosayoda/nvim-lightbulb",
        after = "nvim-lspconfig",
    }
    -- Lua
    use {
        "SmiteshP/nvim-gps",
        requires = "nvim-treesitter/nvim-treesitter",
        wants = "nvim-treesitter",
        config = function()
            require("nvim-gps").setup { separator = " " }
        end,
    }

    if vim.fn.has "unix" == 1 and vim.fn.has "mac" ~= 1 then
        use { "lspcontainers/lspcontainers.nvim" } -- Lang servers in containers
    end
end)
