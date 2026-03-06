local highlight_group = vim.api.nvim_create_augroup("Highlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
    group = highlight_group,
    desc = "Highlight yanked text",
    callback = function()
        vim.hl.on_yank { higroup = "IncSearch", timeout = 1500, on_visual = true }
    end,
})

local cursorline_group = vim.api.nvim_create_augroup("CursorInsertMode", { clear = true })
vim.api.nvim_create_autocmd({ "InsertLeave", "WinEnter" }, {
    group = cursorline_group,
    desc = "Enable cursorline in normal mode",
    callback = function()
        vim.wo.cursorline = true
    end,
})
vim.api.nvim_create_autocmd({ "InsertEnter", "WinLeave" }, {
    group = cursorline_group,
    desc = "Disable cursorline on insert",
    callback = function()
        vim.wo.cursorline = false
    end,
})

local restore_cursor_group = vim.api.nvim_create_augroup("RestoreCursorPosition", { clear = true })
vim.api.nvim_create_autocmd("BufReadPost", {
    group = restore_cursor_group,
    desc = "Return to last known cursor position",
    callback = function(args)
        local buf = args.buf
        if vim.bo[buf].buftype ~= "" then
            return
        end

        local ignored_filetypes = {
            gitcommit = true,
            gitrebase = true,
            svn = true,
        }
        if ignored_filetypes[vim.bo[buf].filetype] then
            return
        end

        local mark = vim.api.nvim_buf_get_mark(buf, '"')
        local row, col = mark[1], mark[2]
        if row > 0 and row <= vim.api.nvim_buf_line_count(buf) then
            pcall(vim.api.nvim_win_set_cursor, 0, { row, col })
        end
    end,
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
--
local lua_buffer_group = vim.api.nvim_create_augroup("ConfigureLuaBufferOptions", { clear = true })
vim.api.nvim_create_autocmd({ "BufReadPost", "BufNewFile" }, {
    group = lua_buffer_group,
    desc = "Configure Lua buffer options",
    pattern = "*.lua",
    callback = function(args)
        vim.bo[args.buf].include = [[\v<((do|load)file|require)[^''"]*[''"]\zs[^''"]+]]
        vim.bo[args.buf].includeexpr = "v:lua.require'utils'.include_expr(v:fname)"
    end,
})

local mini_indent_group = vim.api.nvim_create_augroup("MiniIndentScope", { clear = true })
vim.api.nvim_create_autocmd({ "BufEnter", "TermOpen" }, {
    group = mini_indent_group,
    desc = "Disable indent scope for special buffers",
    callback = function(args)
        local buf = args.buf
        local buftype = vim.bo[buf].buftype
        local filetype = vim.bo[buf].filetype
        vim.b[buf].miniindentscope_disable = buftype == "prompt"
            or vim.tbl_contains({ "help", "terminal", "nofile" }, buftype)
            or filetype == "snacks_picker_input"
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
