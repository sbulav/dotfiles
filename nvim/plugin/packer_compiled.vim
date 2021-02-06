" Automatically generated packer.nvim plugin loader code

if !has('nvim-0.5')
  echohl WarningMsg
  echom "Invalid Neovim version for packer.nvim!"
  echohl None
  finish
endif

packadd packer.nvim

try

lua << END
local package_path_str = "/home/sab/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/sab/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/sab/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/sab/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/sab/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

local function try_loadstring(s, component, name)
  local success, err = pcall(loadstring(s))
  if not success then
    print('Error running ' .. component .. ' for ' .. name)
    error(err)
  end
end

_G.packer_plugins = {
  ["BetterLua.vim"] = {
    loaded = true,
    path = "/home/sab/.local/share/nvim/site/pack/packer/start/BetterLua.vim"
  },
  ["indent-guides.nvim"] = {
    loaded = true,
    path = "/home/sab/.local/share/nvim/site/pack/packer/start/indent-guides.nvim"
  },
  kommentary = {
    loaded = true,
    path = "/home/sab/.local/share/nvim/site/pack/packer/start/kommentary"
  },
  ["nlua.nvim"] = {
    loaded = true,
    path = "/home/sab/.local/share/nvim/site/pack/packer/start/nlua.nvim"
  },
  ["nredir.nvim"] = {
    commands = { "Nredir" },
    loaded = false,
    path = "/home/sab/.local/share/nvim/site/pack/packer/opt/nredir.nvim"
  },
  ["nvim-compe"] = {
    loaded = false,
    path = "/home/sab/.local/share/nvim/site/pack/packer/opt/nvim-compe"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/home/sab/.local/share/nvim/site/pack/packer/start/nvim-lspconfig"
  },
  ["nvim-tree.lua"] = {
    after = { "nvim-web-devicons" },
    loaded = false,
    path = "/home/sab/.local/share/nvim/site/pack/packer/opt/nvim-tree.lua"
  },
  ["nvim-web-devicons"] = {
    load_after = {
      ["nvim-tree.lua"] = true
    },
    loaded = false,
    path = "/home/sab/.local/share/nvim/site/pack/packer/opt/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = false,
    path = "/home/sab/.local/share/nvim/site/pack/packer/opt/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/sab/.local/share/nvim/site/pack/packer/start/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/home/sab/.local/share/nvim/site/pack/packer/start/popup.nvim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/home/sab/.local/share/nvim/site/pack/packer/start/telescope.nvim"
  },
  ["train.nvim"] = {
    loaded = true,
    path = "/home/sab/.local/share/nvim/site/pack/packer/start/train.nvim"
  },
  undotree = {
    loaded = true,
    path = "/home/sab/.local/share/nvim/site/pack/packer/start/undotree"
  },
  ["vim-eunuch"] = {
    loaded = true,
    path = "/home/sab/.local/share/nvim/site/pack/packer/start/vim-eunuch"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/home/sab/.local/share/nvim/site/pack/packer/start/vim-fugitive"
  },
  ["vim-helm"] = {
    loaded = true,
    path = "/home/sab/.local/share/nvim/site/pack/packer/start/vim-helm"
  },
  ["vim-qf"] = {
    loaded = true,
    path = "/home/sab/.local/share/nvim/site/pack/packer/start/vim-qf"
  },
  ["vim-sandwich"] = {
    loaded = true,
    path = "/home/sab/.local/share/nvim/site/pack/packer/start/vim-sandwich"
  },
  ["vim-signify"] = {
    loaded = true,
    path = "/home/sab/.local/share/nvim/site/pack/packer/start/vim-signify"
  },
  ["vim-sneak"] = {
    loaded = true,
    path = "/home/sab/.local/share/nvim/site/pack/packer/start/vim-sneak"
  },
  ["vim-solarized8"] = {
    loaded = false,
    path = "/home/sab/.local/share/nvim/site/pack/packer/opt/vim-solarized8"
  },
  ["vim-startify"] = {
    loaded = true,
    path = "/home/sab/.local/share/nvim/site/pack/packer/start/vim-startify"
  },
  ["vim-terraform"] = {
    loaded = true,
    path = "/home/sab/.local/share/nvim/site/pack/packer/start/vim-terraform"
  }
}


-- Command lazy-loads
vim.cmd [[command! -nargs=* -range -bang -complete=file Nredir lua require("packer.load")({'nredir.nvim'}, { cmd = "Nredir", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]

END

catch
  echohl ErrorMsg
  echom "Error in packer_compiled: " .. v:exception
  echom "Please check your config for correctness"
  echohl None
endtry
