return {
    "phaazon/hop.nvim",
    event = "VeryLazy",
    config = function()
        keys =
            {
                { "f", "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true, inclusive_jump = true })<cr>", "n", desc = "hop hint char after cursor" },
                { "F", "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true, inclusive_jump = true })<cr>", "o", desc = "hop hint char before cursor" },
                { "t", "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true })<cr>", "n", desc = "hop hint char till cursor" },
                { "T", "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })<cr>", "o", desc = "hop hint char before backwards cursor" },
            }, require("hop").setup {}
    end,
}
