vim.filetype.add {
    extension = {
        fish = "fish",
        tf = "terraform",
        tfvars = "terraform",
        tfstate = "json",
        eslintrc = "json",
        prettierrc = "json",
        mdx = "markdown",
    },
    filename = {
        ["kitty.conf"] = "kitty",
        [".gitignore"] = "conf",
    },
    pattern = {
        [".clang*"] = "yaml",
        [".*%.env.*"] = "sh",
        [".*ignore"] = "conf",
        [".*enkinsfile.*"] = "groovy",
    },
}
