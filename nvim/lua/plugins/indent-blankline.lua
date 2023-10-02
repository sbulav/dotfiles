return {
    "lukas-reineke/indent-blankline.nvim",
    event = "BufReadPre",
    main = "ibl",
    config = function()
        require("ibl").setup {
            indent = {
                char = "┊",
            },
            exclude = {
                buftypes = {
                    "NvimTree",
                    "terminal",
                    "term",
                    "gitcommit",
                    "fugitive",
                    "nofile",
                    "Greeter",
                },
                filetypes = {
                    "alpha",
                    "NvimTree",
                    "terminal",
                    "term",
                    "packer",
                    "gitcommit",
                    "fugitive",
                    "nofile",
                    "Greeter",
                    "TelescopePrompt",
                    "Float",
                },
            },
            scope = {
                enabled = true,
                show_start = false,
            },
        }
    end,
}
