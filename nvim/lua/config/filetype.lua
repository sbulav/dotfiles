local is_helm = function(path)
    for dir in vim.fs.parents(path) do
        if vim.fn.fnamemodify(dir, ":t") == "templates" then
            if vim.fn.filereadable(vim.fs.dirname(dir) .. "/Chart.yaml") == 1 then
                return "helm"
            end
        end
    end
    return "yaml"
end

vim.filetype.add {
    extension = {
        yaml = is_helm,
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
