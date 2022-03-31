local autocmds = {
    no_cursorline_in_insert_mode = {
        { "InsertLeave,WinEnter", "*", "set cursorline" },
        { "InsertEnter,WinLeave", "*", "set nocursorline" },
    },
    hl_yank = {
        { "TextYankPost", "*", 'lua vim.highlight.on_yank{higroup="IncSearch", timeout=1500, on_visual=true}' },
    },
    restore_curpos = {
        {
            "BufReadPost",
            "*",
            [[
        if line("'\"") >= 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
        ]],
        },
    },
    add_filetypes = {
        { "BufNewFile,BufRead", "*.fish", "set filetype=fish commentstring=#%s" },
        { "BufNewFile,BufRead", "*enkinsfile*", "set filetype=groovy" },
        { "BufWritePre", "*enkinsfile*", "lua require'jenkinsfile_linter'.validate()" },
    },
}

require("utils").nvim_create_augroups(autocmds)
