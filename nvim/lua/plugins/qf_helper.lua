-- Better work with quickfix
return {
    "stevearc/qf_helper.nvim",
    event = "VeryLazy",
    config = function()
        require("qf_helper").setup {}
    end,
}
