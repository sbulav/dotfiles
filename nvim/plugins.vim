" Auto install vim-plug
if has('nvim')
    if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
      silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    endif
    call plug#begin('~/.local/share/nvim/plugged')
endif

" Add all your plugins here (note older versions of Vundle used Bundle instead of Plug)
" Interface
Plug 'myusuf3/numbers.vim'             " Intelligently toggle line numbers
Plug 'tpope/vim-commentary'            " Comment stuff in and out
Plug 'tpope/vim-eunuch'                " Integration with UNIX shell
Plug 'machakann/vim-sandwich'          " Surround objects with any character e.g. saiw|sdb|srb"
Plug 'justinmk/vim-sneak'              " Jump to location specified by two characters
Plug 'romainl/vim-qf'                  " Better work with quickfix
Plug 'mbbill/undotree'                 " Undotree
Plug 'mhinz/vim-startify'              " Startup screen
Plug 'tjdevries/train.nvim'            " Train vim movements
Plug 'sbulav/nredir.nvim'              " Redirect output to scratch buffer
Plug 'kyazdani42/nvim-web-devicons'    " for file icons
Plug 'kyazdani42/nvim-tree.lua'        " File manager
Plug 'nvim-lua/popup.nvim'             " Telescope required libs
Plug 'nvim-lua/plenary.nvim'           " Telescope required libs
Plug 'nvim-telescope/telescope.nvim'   " Fuzzy finder
Plug 'glepnir/indent-guides.nvim'      " Indentation highlighs

" Version Control Plugins
Plug 'mhinz/vim-signify'               " Git line status
Plug 'tpope/vim-fugitive'              " Git combine

" Languages
Plug 'hashivim/vim-terraform'          " Terraform syntax highlight
Plug 'sbulav/vim-helm'                 " Helm syntax and compiler
Plug 'neovim/nvim-lspconfig'           " LSP templates and completions
Plug 'nvim-lua/completion-nvim'        " Async completions for nvim-lsp
" Plug 'Konfekt/vim-compilers'           " Set of vim compilers

" Code display
Plug 'lifepillar/vim-solarized8'

" Lua
Plug 'tjdevries/nlua.nvim'

" (OPTIONAL): This is a suggested plugin to get better Lua syntax highlighting
"   but it's not currently required
Plug 'euclidianAce/BetterLua.vim'

" Python
" Plug 'janko/vim-test'                  " Running tests

" Text objects
" Provided by vim-sandwitch              " TO closest pair of quotes of any type ib/ab
" Plug 'jceb/vim-textobj-uri'              " TO URL                                iu/au
" Plug 'kana/vim-textobj-entire'           " TO entire buffer                      ie/ae
" Plug 'kana/vim-textobj-fold'             " TO folding                            iz/az
" Plug 'kana/vim-textobj-function'         " TO function                           if/af
" Plug 'kana/vim-textobj-indent'           " TO block of code based on indent      ii/ai
" Plug 'kana/vim-textobj-line'             " TO line                               il/al
" Plug 'kana/vim-textobj-user'             " Allow use of custom textobjects

call plug#end()
