-- load packer
local packer = prequire("config.packer")

if not packer then
    return
end

packer.startup(function(use)
  -- Packer plugin manager
  use {'wbthomason/packer.nvim'}

  -- Interface plugins
  use {'b3nj5m1n/kommentary'}               -- Comment stuff in and out
  use {'tpope/vim-eunuch'}                  -- Integration with UNIX shell
  use {'machakann/vim-sandwich'}            -- Surround objects with any character e.g. saiw|sdb|srb"
  use {'justinmk/vim-sneak'}                -- Jump to location specified by two characters
  use {'romainl/vim-qf'}                    -- Better work with quickfix
  use {'mbbill/undotree'}                   -- Undotree
  use {'goolord/alpha-nvim',                -- Startup screen
    requires = { 'kyazdani42/nvim-web-devicons' },
    config = function() require('config.alpha') end,
  }
  use {'phaazon/hop.nvim',                  -- Easymotion in lua
    config = function() require('config.hop') end,
  }

  --[[ use {'sbulav/nredir.nvim',                -- Redirect output to scratch buffer
    opt = true,
    cmd = 'Nredir'
  } ]]
  use {'glepnir/indent-guides.nvim'}        -- Indentation highlighs
  use {                                     -- Telescope fuzzy finder
    'nvim-telescope/telescope.nvim',
    requires = {
      {'nvim-lua/popup.nvim'},
      {'nvim-lua/plenary.nvim'},
      {'nvim-telescope/telescope-project.nvim'},
      {'nvim-telescope/telescope-github.nvim'},
      -- {'/Users/sergey_bulavincev/git_priv/telescope-github.nvim'},
      -- {'nvim-telescope/telescope-fzy-native.nvim'}, -- fast finder
      -- {'nvim-telescope/telescope-media-files.nvim'}, -- media preview
      -- {'nvim-telescope/telescope-frecency.nvim'}, -- media preview
    },
    config = function() require('config.telescope') end,
  }
  -- better text highlighting
      -- better text highlighting
  use {
    'nvim-treesitter/nvim-treesitter',
    event = 'BufRead',
    config = function() require('config.treesitter') end,
    run = ':TSUpdate',
  }
  -- use 'nvim-treesitter/playground'
  use {                                     -- Tree file manager
    'kyazdani42/nvim-tree.lua',
    requires = {
      {'kyazdani42/nvim-web-devicons'}
    },
    config = function() require('config.nvim-tree') end,
  }

  -- Version Control Plugins
  use {'mhinz/vim-signify'}                  -- Git line status
  use {'tpope/vim-fugitive'}                 -- Git combine

  -- Languages
  use {'hashivim/vim-terraform'}             -- Terraform syntax highlight

  -- Code display
  use {'lifepillar/vim-solarized8', opt = true}
  use {'mhartington/oceanic-next', opt = true}
  -- Lua
  use {'tjdevries/nlua.nvim'}
  use {'euclidianAce/BetterLua.vim'}

  -- Tests
  use {'janko/vim-test'}

  -- completion engine
  use {
      'hrsh7th/nvim-cmp',
      event = "BufRead",
      requires = {
          { 'hrsh7th/cmp-buffer', after = 'nvim-cmp', },
          { 'hrsh7th/cmp-nvim-lua', after = 'nvim-cmp', },
          { 'hrsh7th/cmp-nvim-lsp', after = 'nvim-cmp', },
          { 'saadparwaiz1/cmp_luasnip', after = 'LuaSnip', },
      },
      config = function() require('config.cmp') end,
  }

  -- snippets
  use {
      'L3MON4D3/LuaSnip',
      after = 'nvim-cmp',
  }
  -- LSP
  -- lsp configuration
  use {
      'neovim/nvim-lspconfig',
      after = 'cmp-nvim-lsp',
      config = function() require('lspnew') end,
  }

  -- great ui for lsp
  use {
      'glepnir/lspsaga.nvim',
      after = 'nvim-lspconfig',
      config = function() require('config.saga') end,
  }


  if vim.fn.has("unix") == 1 and vim.fn.has("mac") ~=1 then
    use { 'lspcontainers/lspcontainers.nvim' }   -- Lang servers in containers
  end
end)
