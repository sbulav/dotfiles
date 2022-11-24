-- load packer
local packer = prequire "config.packer"

if not packer then
    return
end

packer.startup(function(use)
    -- Packer plugin manager
    use { "wbthomason/packer.nvim" }

    -- Interface plugins{{{
    -- My base16 colorscheme
    use { "sbulav/base16" }
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
        commit = "6af3b19",
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
            require "config.indent"
        end,
    }
    -- Indentation line and textobj ii/ai
    use {
        "echasnovski/mini.indentscope",
        config = function()
            require "config.indentscope"
        end,
    }
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
    } --}}}
    -- Telescope fuzzy finder{{{
    use {
        "nvim-telescope/telescope.nvim",
        requires = {
            { "nvim-lua/popup.nvim" },
            { "nvim-lua/plenary.nvim" },
            { "nvim-telescope/telescope-github.nvim" },
            { "kosayoda/nvim-lightbulb" },
            { "antoinemadec/FixCursorHold.nvim" },
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
    } --}}}
    -- Treesitter{{{
    -- better text highlighting
    use {
        "nvim-treesitter/nvim-treesitter",
        -- event = "BufRead"",
        config = function()
            require "config.treesitter"
        end,
        run = ":TSUpdate",
    }
    -- Show current code context
    use {
        "SmiteshP/nvim-navic",
    }
    -- Show JSON path
    use {
        "phelipetls/jsonpath.nvim",
        ft = { "json" },
    }
    -- Parenthesis highlighting
    use {
        "p00f/nvim-ts-rainbow",
        after = "nvim-treesitter",
    } --}}}
    -- Utilities{{{
    use "nvim-treesitter/playground"
    -- Tree file manager
    use {
        "lmburns/lf.nvim",
    }
    -- Integration with UNIX shell
    use { "tpope/vim-eunuch" }
    -- Surround objects with any character e.g. saiw|sdb|srb"
    use { "machakann/vim-sandwich" }
    -- Better work with quickfix
    use {
        "stevearc/qf_helper.nvim",
        config = function()
            require("qf_helper").setup()
        end,
    }
    -- Undotree
    use { "mbbill/undotree" }
    --}}}
    -- Version Control Plugins{{{
    -- Fugitive!
    use { "tpope/vim-fugitive" }
    -- Show changed lines
    use {
        "lewis6991/gitsigns.nvim",
        requires = {
            "nvim-lua/plenary.nvim",
        },
        config = function()
            require("gitsigns").setup()
        end,
        -- tag = 'release' -- To use the latest release
    } --}}}
    -- Tests{{{
    use { "janko/vim-test" } --}}}
    -- Code completion{{{
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
    -- Tabnine CMP completion source
    use {
        "tzachar/cmp-tabnine",
        after = "nvim-cmp",
        run = "./install.sh",
        config = function()
            require "config.cmp_tabnine"
        end,
    }
    -- Snippets
    use {
        "L3MON4D3/LuaSnip",
        after = "nvim-cmp",
        config = function()
            require "config.snippets"
        end,
    } --}}}
    -- LSP{{{
    -- lsp configuration
    use {
        "neovim/nvim-lspconfig",
        -- after = "cmp-nvim-lsp",
        config = function()
            require "lsp"
        end,
    }
    -- Null language server
    use {
        "jose-elias-alvarez/null-ls.nvim",
        after = "nvim-lspconfig",
        config = function()
            require "lsp.null-ls"
        end,
    }
    use {
        "williamboman/mason.nvim",
        config = function()
            require "lsp.mason"
        end,
    }
    use { "williamboman/mason-lspconfig.nvim" }
    use {
        "jayp0521/mason-null-ls.nvim",
        after = "null-ls.nvim",
        config = function()
            require "lsp.mason-null-ls"
        end,
    }
    -- Ui for lsp, tami5 has maintained fork
    use {
        "tami5/lspsaga.nvim",
        after = "nvim-lspconfig",
        config = function()
            require "config.saga"
        end,
    }
    -- Show a lightbulb when code action are available
    use {
        "kosayoda/nvim-lightbulb",
        after = "nvim-lspconfig",
    }
    -- Lint Jenkins files
    use { "ckipp01/nvim-jenkinsfile-linter", requires = { "nvim-lua/plenary.nvim" } } --}}}
    -- jsonls schemas
    use { "b0o/schemastore.nvim" }
end)
