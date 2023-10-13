return {
    "sourcegraph/sg.nvim",
    cmd = { "CodyAsk", "CodyChat", "CodyToggle", "CodyTask", "CodyTaskView" },
    -- event = "VeryLazy",
    keys = {
        {
            "<leader>sF",
            function()
                require("sg.extensions.telescope").fuzzy_search_results()
            end,
            desc = "sourcegraph-fuzzy-search",
        },
        { "<leader>cc", "<cmd>CodyChat<CR>", desc = "cody-chat", mode = { "n", "x" } },
        { "<leader>ca", ":CodyAsk<space>", desc = "cody-ask", mode = { "n", "x" } },
        { "<leader>cd", ":CodyTask<space>", desc = "cody-task", mode = { "n", "x" } },
        { "<leader>cn", "<cmd>CodyTaskNext<CR>", desc = "cody-task-next", mode = { "n", "x" } },
        { "<leader>cp", "<cmd>CodyTaskPrev<CR>", desc = "cody-task-prev", mode = { "n", "x" } },
        { "<leader>ct", "<cmd>CodyToggle<CR>", desc = "cody-toggle", mode = { "n", "x" } },
        { "<leader>cv", "<cmd>CodyTaskView<CR>", desc = "cody-task-view", mode = { "n", "x" } },
        { "<leader>cy", "<cmd>CodyTaskAccept<CR>", desc = "cody-task-accept", mode = { "n", "x" } },
        { "<leader>sL", "<cmd>SourcegraphLink<CR>", desc = "sourcegraph-link" },
        { "<leader>sg", "<cmd>SourcegraphSearch<CR>", desc = "sourcegraph-search" },
    },
    -- Example sg search context:global repo:^github\.com/.*/dotfiles$ file:.*.lua sg.nvim
    dependencies = { "nvim-lua/plenary.nvim" },
}
