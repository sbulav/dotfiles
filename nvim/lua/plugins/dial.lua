-- better increase/descrease
return {
    "monaqa/dial.nvim",
    event = "VeryLazy",
  -- stylua: ignore
  -- false
  keys = {
    { "<C-a>", function() return require("dial.map").inc_normal() end, expr = true, desc = "Increment" },
    { "<C-x>", function() return require("dial.map").dec_normal() end, expr = true, desc = "Decrement" },
  },
    config = function()
        local augend = require "dial.augend"
        require("dial.config").augends:register_group {
            default = {
                augend.integer.alias.decimal,
                augend.integer.alias.hex,
                augend.date.alias["%Y/%m/%d"],
                augend.constant.alias.bool,
                augend.semver.alias.semver,
                augend.constant.new { elements = { "let", "const" } },
                augend.constant.new { elements = { "True", "False" } },
                augend.constant.new { elements = { "enabled", "disabled" } },
                augend.constant.new { elements = { "enable", "disable" } },
            },
        }
    end,
}
