return {
    -- Undotree
    { "mbbill/undotree", cmd = { "UndotreeToggle" } },

    -- Fugitive!
    {
        "tpope/vim-fugitive",
        cmd = { "Git", "Gread", "Gwrite", "GBranches", "Gdiff", "Gvdiffsplit", "Git blame" },
    },
    { "janko/vim-test", cmd = { "TestNearest", "TestFile", "TestSuite", "TestLast", "TestVisit" } },

    -- Redirect output to scratch buffer
    "sbulav/nredir.nvim",

    -- Lint Jenkins files
    -- { "ckipp01/nvim-jenkinsfile-linter", dependencies = { "nvim-lua/plenary.nvim" }, ft = "groovy" },
    -- { dir = "~/git_priv/validate-gitlab-ci.nvim", dependencies = { "nvim-lua/plenary.nvim" }, ft = "yaml" },
    -- { "sbulav/validate-gitlab-ci.nvim", dependencies = { "nvim-lua/plenary.nvim" } },

    -- Encode/decode base64 strings
    "sbulav/base64.nvim",
}
