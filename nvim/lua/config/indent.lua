require("indent_blankline").setup {
    char = "┊",
    buftype_exclude = { "terminal", "telescope", "nofile" },
    filetype_exclude = { "alpha", "help", "dashboard", "packer", "NvimTree", "Trouble", "TelescopePrompt", "Float" },
    show_trailing_blankline_indent = false,
    use_treesitter = true,
    show_current_context = true,
    show_current_context_start = false,
    show_end_of_line = false,
    space_char_blankline = " ",
}
