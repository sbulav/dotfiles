return {
    -- Surround objects with any character e.g. saiw|sdb|srb"
    { "machakann/vim-sandwich", event = "VeryLazy" },

    -- Undotree
    { "mbbill/undotree", cmd = { "UndotreeToggle" } },

    -- Fugitive!
    {
        "tpope/vim-fugitive",
        cmd = { "Git", "GBranches", "Gdiff", "Gvdiffsplit", "Git blame" },
    },
    { "janko/vim-test", cmd = { "TestNearest", "TestFile", "TestSuite", "TestLast", "TestVisit" } },

    -- Tree file manager
    "lmburns/lf.nvim",

    -- Redirect output to scratch buffer
    "sbulav/nredir.nvim",

    -- Show a lightbulb when code action are available
    "kosayoda/nvim-lightbulb",

    -- Lint Jenkins files
    { "ckipp01/nvim-jenkinsfile-linter", dependencies = { "nvim-lua/plenary.nvim" }, ft = "groovy" },

    -- Encode/decode base64 strings
    "sbulav/base64.nvim",
}