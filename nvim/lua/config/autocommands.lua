vim.api.nvim_create_augroup("Highlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
    command = "silent! lua vim.highlight.on_yank({higroup='IncSearch', timeout=1500, on_visual = true})",
    group = "Highlight",
    desc = "Highlight yanked text",
})

vim.api.nvim_create_augroup("CursorInsertMode", { clear = true })
vim.api.nvim_create_autocmd({ "InsertLeave", "WinEnter" }, {
    callback = function()
        vim.opt.cursorline = true
    end,
    group = "CursorInsertMode",
    desc = "Enable cursorline in normal mode",
})
vim.api.nvim_create_autocmd({ "InsertEnter", "WinLeave" }, {
    callback = function()
        vim.opt.cursorline = false
    end,
    group = "CursorInsertMode",
    desc = "Disable cursorline on insert",
})

vim.api.nvim_create_augroup("RestoreCursorPosition", { clear = true })
vim.api.nvim_create_autocmd("BufReadPost", {
    callback = function()
        -- TODO?: filetype/buftype exclude
        local row, col = unpack(vim.api.nvim_buf_get_mark(0, '"'))
        if row > 0 and row <= vim.api.nvim_buf_line_count(0) then
            vim.api.nvim_win_set_cursor(0, { row, col })
        end
    end,
    desc = "Return to last known cursor position",
    group = "RestoreCursorPosition",
})
-- vim.api.nvim_create_augroup("ValidateJenkinsfiles", { clear = true })
-- vim.api.nvim_create_autocmd("BufWritePre", {
--     callback = function()
--         utils.info("Validating Jenkinsfile", "LSP")
--         require("jenkinsfile_linter").validate()
--     end,
--     group = "ValidateJenkinsfiles",
--     desc = "Validate Jenkins files on save",
--     pattern = "*enkinsfile*",
-- })

vim.api.nvim_create_augroup("ConfugureLuaBo", { clear = true })
vim.api.nvim_create_autocmd("BufRead", {
    callback = function()
        vim.bo.include = [[\v<((do|load)file|require)[^''"]*[''"]\zs[^''"]+]]
        vim.bo.includeexpr = "v:lua.require'utils'.include_expr(v:fname)"
    end,
    group = "ConfugureLuaBo",
    desc = "Configure Lua Buffer opts on Read",
    pattern = "*.lua",
})

vim.api.nvim_create_augroup("MiniIndentScope", { clear = true })
vim.api.nvim_create_autocmd({ "BufEnter", "TermOpen" }, {
    desc = "Disable indent scope for conent types",
    group = "MiniIndentScope",
    callback = function()
        vim.b.miniindentscope_disable = vim.tbl_contains({ "help", "terminal", "nofile", "prompt" }, vim.bo.buftype)
    end,
})

vim.api.nvim_create_user_command("FormatDisable", function(args)
    if args.bang then
        -- FormatDisable! will disable formatting just for this buffer
        vim.b.disable_autoformat = true
    else
        vim.g.disable_autoformat = true
    end
end, {
    desc = "Disable autoformat-on-save",
    bang = true,
})
vim.api.nvim_create_user_command("FormatEnable", function()
    vim.b.disable_autoformat = false
    vim.g.disable_autoformat = false
end, {
    desc = "Re-enable autoformat-on-save",
})
