-- import mason-null-ls plugin safely
local mason_null_ls_status, mason_null_ls = pcall(require, "mason-null-ls")
if not mason_null_ls_status then
    return
end

mason_null_ls.setup {
    -- list of formatters & linters for mason to install
    ensure_installed = {
        "gofmt",
        "stylua",
        "jq",
    },
    -- auto-install configured formatters & linters (with null-ls)
    automatic_installation = true,
}
