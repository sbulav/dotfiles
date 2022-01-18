--[[ local nvimtree = prequire("nvim-tree.lua")
if not nvimtree then
  return
end ]]
-- File explorer config
require("nvim-tree").setup {
  open_on_setup = true,
  auto_close = true,
  update_cwd = true,
  ignore_ft_on_setup = { "startify", "dashboard", "alpha" },
  view = {
    width = 40,
    height = 30,
    side = "left",
    auto_resize = false,
    mappings = {
      custom_only = false,
      list = {},
    },
  },
  filters = {
    dotfiles = false,
    custom = { ".swp", ".pyc", ".git", "node_modules", ".cache" },
  },
}
