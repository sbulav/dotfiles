local utils = require "utils"

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
vim.api.nvim_create_augroup("ValidateJenkinsfiles", { clear = true })
vim.api.nvim_create_autocmd("BufWritePre", {
    callback = function()
        utils.info("Validating Jenkinsfile", "LSP")
        require("jenkinsfile_linter").validate()
    end,
    group = "ValidateJenkinsfiles",
    desc = "Validate Jenkins files on save",
    pattern = "*enkinsfile*",
})
