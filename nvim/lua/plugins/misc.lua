return {
    -- Undotree
    { "mbbill/undotree", cmd = { "UndotreeToggle" } },

    -- Fugitive!
    {
        "tpope/vim-fugitive",
        cmd = { "Git", "Gread", "Gwrite", "GBranches", "Gdiff", "Gvdiffsplit", "Git blame" },
    },
    { "janko/vim-test", cmd = { "TestNearest", "TestFile", "TestSuite", "TestLast", "TestVisit" } },

    -- Tree file manager
    { "lmburns/lf.nvim", commit = "6f9c27c" },

    -- Redirect output to scratch buffer
    "sbulav/nredir.nvim",

    -- Lint Jenkins files
    -- { "ckipp01/nvim-jenkinsfile-linter", dependencies = { "nvim-lua/plenary.nvim" }, ft = "groovy" },

    -- Encode/decode base64 strings
    "sbulav/base64.nvim",
}
