local utils = require "utils"

vim.api.nvim_create_augroup("Highlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
    command = "silent! lua vim.highlight.on_yank() {higroup='IncSearch', timeout=1500}",
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
    pattern = "*enkinsfile*",
})
vim.api.nvim_create_augroup("ValidateJenkinsfiles", { clear = true })
vim.api.nvim_create_autocmd("BufWritePre", {
    callback = function()
        utils.info("Validating Jenkinsfile", "LSP")
        require("jenkinsfile_linter").validate()
    end,
    group = "ValidateJenkinsfiles",
    desc = "Validate Jenkins files on save",
})
-- vim.api.nvim_create_autocmd("CursorHold,CursorHoldI", {
--   callback = require("nvim-lightbulb").update_lightbulb,
-- })
--

-- highlight-symbol-on-cursor-hold
-- vim.api.nvim_create_augroup('cursor_hold_word', { clear = true })
-- vim.api.nvim_create_autocmd( 'CursorHold',
--     {
--         group = 'cursor_hold_word',
--         pattern = '*',
--         --buffer = 0,
--         callback = function()
--             if vim.lsp.buf_is_attached() then
--                 vim.lsp.buf.document_highlight()
--             end
--         end
--     }
-- )
-- vim.api.nvim_create_autocmd( 'CursorMoved',
--     {
--         group = 'cursor_hold_word',
--         --buffer = 0,
--         pattern = '*',
--         callback = vim.lsp.buf.clear_references
--     }
-- )
--
-- disable number line on terminal
-- vim.api.nvim_create_autocmd("TermOpen", {
-- 	group = termaug,
-- 	callback = function()
-- 		vim.opt.number = false
-- 		vim.opt.relativenumber = false
-- 	end,
-- })
--
-- vim.api.nvim_create_augroup('NeovimTerminal', { clear = true })
--
-- vim.api.nvim_create_autocmd('TermOpen', {
--   group = 'NeovimTerminal',
--   pattern = 'term://*',
--   command = "lua require('utils').set_terminal_keymaps()",
-- })
--
-- vim.api.nvim_create_autocmd('TermOpen', {
--   group = 'NeovimTerminal',
--   pattern = '*',
--   command = 'startinsert',
-- })
--
-- vim.api.nvim_create_autocmd('TermOpen', {
--   group = 'NeovimTerminal',
--   pattern = '*',
--   command = 'set nonumber norelativenumber nobuflisted',
-- })
--
-- vim.api.nvim_create_autocmd('TermOpen', {
--   group = 'NeovimTerminal',
--   pattern = '*',
--   command = 'nnoremap <buffer> <C-c> i<C-c>',
-- })
