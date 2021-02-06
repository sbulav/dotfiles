local cmd = vim.cmd
local fn = vim.fn

-- Check that packer is installed, try to install otherwise
local packer_exists = pcall(cmd, [[packadd packer.nvim]])

if not packer_exists then
  if fn.input("Download Packer? (y for yes)") ~= "y" then
    return
  end

  local directory = string.format(
    '%s/site/pack/packer/opt/',
    fn.stdpath('data')
  )

  fn.mkdir(directory, 'p')

  local out = fn.system(string.format(
    'git clone %s %s',
    'https://github.com/wbthomason/packer.nvim',
    directory .. '/packer.nvim'
  ))

  print(out)
  print("Downloading packer.nvim...")
  print("( You'll need to restart now )")

  return
end

-- Load packer from pack, requied as packer is opt
cmd[[packadd! packer.nvim]]

return require('packer').startup(function()
  -- Packer plugin manager
  use {'wbthomason/packer.nvim', opt = true}

  -- Interface plugins
  -- use {'myusuf3/numbers.vim'}               -- Intelligently toggle line numbers
  -- use {'tpope/vim-commentary'}              -- Comment stuff in and out
  use {'b3nj5m1n/kommentary'}               -- Comment stuff in and out
  use {'tpope/vim-eunuch'}                  -- Integration with UNIX shell
  use {'machakann/vim-sandwich'}            -- Surround objects with any character e.g. saiw|sdb|srb"
  use {'justinmk/vim-sneak'}                -- Jump to location specified by two characters
  use {'romainl/vim-qf'}                    -- Better work with quickfix
  use {'mbbill/undotree'}                   -- Undotree
  use {'mhinz/vim-startify'}                -- Startup screen
  use {'tjdevries/train.nvim'}              -- Train vim movements
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
      -- {'nvim-telescope/telescope-fzy-native.nvim'}, -- fast finder
      -- {'nvim-telescope/telescope-media-files.nvim'}, -- media preview
      -- {'nvim-telescope/telescope-frecency.nvim'}, -- media preview
    },
  }
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
  use {'sbulav/vim-helm'}                    -- Helm syntax and compiler

  use {'neovim/nvim-lspconfig'}              -- LSP templates and completions
  use {'hrsh7th/nvim-compe', opt = true}     -- completions for nvim-lsp

  -- Code display
  use {'lifepillar/vim-solarized8', opt = true}

  -- Lua
  use {'tjdevries/nlua.nvim'}
  use {'euclidianAce/BetterLua.vim'}

  -- Tests
  -- use {'janko/vim-test'}

end)
