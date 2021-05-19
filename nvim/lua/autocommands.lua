local autocmds = {
    no_cursorline_in_insert_mode = {
        {'InsertLeave,WinEnter', '*', 'set cursorline'},
        {'InsertEnter,WinLeave', '*', 'set nocursorline'},
    },
    hl_yank = {
        {'TextYankPost',  '*', 'lua vim.highlight.on_yank{higroup="IncSearch", timeout=1500, on_visual=true}'},
    },
}

require'utils'.nvim_create_augroups(autocmds)
