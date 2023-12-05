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
        [".*/playbooks/.*.yml"] = "yaml.ansible",
        [".*/playbooks/.*.yaml"] = "yaml.ansible",
        [".*/roles/.*/.*.yml"] = "yaml.ansible",
        [".*/roles/.*/.*.yaml"] = "yaml.ansible",
        [".*/handlers/.*/.*.yml"] = "yaml.ansible",
        [".*/handlers/.*/.*.yaml"] = "yaml.ansible",
    },
}
