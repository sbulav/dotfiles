local treesitter = prequire("nvim-treesitter.configs")
if not treesitter then
  return
end

treesitter.setup({
    playground = { enable = true },
    ensure_installed = {
        "python",
        "javascript",
        "typescript",
        "lua",
        "yaml",
        "comment",
    },
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
})
