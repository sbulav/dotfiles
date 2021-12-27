-- load packer
local packer = prequire "config.packer"

if not packer then
    return
end

packer.startup(function(use)
    -- Packer plugin manager
    use { "wbthomason/packer.nvim" }

    -- Interface plugins
    use {
        "numToStr/Comment.nvim",
        config = function()
            require("Comment").setup()
        end,
    }
    use { "nathom/filetype.nvim" } -- speed up filetype detection
    use { "tpope/vim-eunuch" } -- Integration with UNIX shell
    use { "machakann/vim-sandwich" } -- Surround objects with any character e.g. saiw|sdb|srb"
    use { "romainl/vim-qf" } -- Better work with quickfix
    use { "mbbill/undotree" } -- Undotree
    use {
        "goolord/alpha-nvim", -- Startup screen
        requires = { "kyazdani42/nvim-web-devicons" },
        config = function()
            require "config.alpha"
        end,
    }
    use {
        "rcarriga/nvim-notify",
        event = "VimEnter",
        config = function()
            vim.notify = require "notify"
        end,
    }
    use {
        "phaazon/hop.nvim", -- Easymotion in lua
        config = function()
            require "config.hop"
        end,
    }
    use {
        "sbulav/nredir.nvim", -- Redirect output to scratch buffer
    }
    use { "glepnir/indent-guides.nvim" } -- Indentation highlighs
    use { -- Telescope fuzzy finder
        "nvim-telescope/telescope.nvim",
        requires = {
            { "nvim-lua/popup.nvim" },
            { "nvim-lua/plenary.nvim" },
            { "nvim-telescope/telescope-project.nvim" },
            { "sbulav/telescope-github.nvim" },
            -- { "nvim-telescope/telescope-github.nvim" },
            -- { "/Users/sab/git_priv/telescope-github.nvim" },
            -- {'nvim-telescope/telescope-fzy-native.nvim'}, -- fast finder
            -- {'nvim-telescope/telescope-media-files.nvim'}, -- media preview
            -- {'nvim-telescope/telescope-frecency.nvim'}, -- media preview
        },
        config = function()
            require "config.telescope"
        end,
    }
    -- better text highlighting
    use {
        "nvim-treesitter/nvim-treesitter",
        event = "BufRead",
        config = function()
            require "config.treesitter"
        end,
        run = ":TSUpdate",
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

    -- Languages
    use { "hashivim/vim-terraform" } -- Terraform syntax highlight

    -- Code display
    use { "lifepillar/vim-solarized8", opt = true }
    use { "mhartington/oceanic-next", opt = true }

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
            { "hrsh7th/cmp-nvim-lua", after = "nvim-cmp" },
            { "hrsh7th/cmp-nvim-lsp", after = "nvim-cmp" },
            { "saadparwaiz1/cmp_luasnip", after = "LuaSnip" },
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

    if vim.fn.has "unix" == 1 and vim.fn.has "mac" ~= 1 then
        use { "lspcontainers/lspcontainers.nvim" } -- Lang servers in containers
    end
end)
