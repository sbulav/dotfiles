return {
    -- Undotree
    { "mbbill/undotree", cmd = { "UndotreeToggle" } },

    -- Fugitive!
    {
        "tpope/vim-fugitive",
        cmd = { "Git", "Gread", "Gwrite", "GBranches", "Gdiff", "Gvdiffsplit", "Git blame" },
    },
    { "janko/vim-test", cmd = { "TestNearest", "TestFile", "TestSuite", "TestLast", "TestVisit" } },

    {
        "rolv-apneseth/tfm.nvim",
        opts = {
            file_manager = "yazi",
            replace_netrw = true,
            keybindings = {
                ["<ESC>"] = "q",
            },
            -- Customise UI. The below options are the default
            ui = {
                border = "rounded",
                height = 0.9,
                width = 0.9,
                x = 0.5,
                y = 0.5,
            },
        },
    },
    -- {
    --     "DreamMaoMao/yazi.nvim",
    --     dependencies = {
    --         "nvim-telescope/telescope.nvim",
    --         "nvim-lua/plenary.nvim",
    --     },
    --     config = function()
    --         require("yazi").setup {}
    --     end,
    -- },

    -- Redirect output to scratch buffer
    "sbulav/nredir.nvim",

    -- Lint Jenkins files
    -- { "ckipp01/nvim-jenkinsfile-linter", dependencies = { "nvim-lua/plenary.nvim" }, ft = "groovy" },

    -- Encode/decode base64 strings
    "sbulav/base64.nvim",
}
