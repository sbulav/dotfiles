-- load packer
-- local packer = require'utils'.prequire("config.packer")
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
  use {'mhinz/vim-startify'}                -- Startup screen
  use {'phaazon/hop.nvim'}                  -- Easymotion in lua
  use {'sbulav/nredir.nvim',                -- Redirect output to scratch buffer
    opt = true,
    cmd = 'Nredir'
  }
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
  }
  -- better text highlighting
  use {
      "nvim-treesitter/nvim-treesitter",
      branch = "0.5-compat",
      -- event = "BufRead",
      config = require('config.treesitter')
  }
  use {'nvim-treesitter/playground'}
  use {                                     -- Tree file manager
    'kyazdani42/nvim-tree.lua',
    opt = true,
    requires = {
      {'kyazdani42/nvim-web-devicons', opt = true}
    },
  }

  -- Version Control Plugins
  use {'mhinz/vim-signify'}                  -- Git line status
  use {'tpope/vim-fugitive'}                 -- Git combine

  -- Languages
  use {'hashivim/vim-terraform'}             -- Terraform syntax highlight

  use {'neovim/nvim-lspconfig'}              -- LSP templates and completions
  use {'hrsh7th/nvim-compe'}                 -- completions for nvim-lsp
  use {'glepnir/lspsaga.nvim'}               -- LSP templates and completions
  if vim.fn.has("unix") == 1 and vim.fn.has("mac") ~=1 then 
    use 'lspcontainers/lspcontainers.nvim'   -- Lang servers in containers
  end

  -- Code display
  use {'lifepillar/vim-solarized8', opt = true}
  use {'mhartington/oceanic-next', opt = true}
  -- Lua
  use {'tjdevries/nlua.nvim'}
  use {'euclidianAce/BetterLua.vim'}

  -- Tests
  use {'janko/vim-test'}

end)
