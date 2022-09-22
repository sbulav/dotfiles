local attach_opts = { silent = true }

local function url_repo()
    local cursorword = vim.fn.expand "<cfile>"
    if string.find(cursorword, "^[a-zA-Z0-9.-]*/[a-zA-Z0-9.-]*$") then
        cursorword = "https://github.com/" .. cursorword
    end
    return cursorword or ""
end

local open_command = "xdg-open"
if vim.fn.has "mac" == 1 then
    open_command = "open"
end
vim.keymap.set("n", "gx", function()
    vim.fn.jobstart({ open_command, url_repo() }, { detach = true })
end, attach_opts)

--- Commands to troubleshoot LSP{{{
--- :lua print(vim.inspect(vim.lsp.buf_get_clients()))
--- :lua vim.cmd('e'..vim.lsp.get_log_path())
--- :LspInfo
--- Set log level to debug:
--- vim.lsp.set_log_level("debug")}}}

function Show_documentation()
    if vim.fn.index({ "vim", "help" }, vim.bo.filetype) >= 0 then
        vim.cmd("h " .. vim.fn.expand "<cword>")
    else
        require("lspsaga.hover").render_hover_doc()
    end
end

vim.keymap.set("n", "K", function()
    Show_documentation()
end, attach_opts)
vim.keymap.set({ "n", "t" }, "<leader>t9", function()
    _K9S_TOGGLE()
end, attach_opts)
vim.keymap.set({ "n", "t" }, "<M-\\>", "<cmd>ToggleTerm direction=float<CR>", attach_opts)

--- luasnip keymappings
vim.keymap.set({ "i", "s" }, "<c-x>", function()
    require("luasnip").expand_or_jump()
end, attach_opts)
vim.keymap.set({ "i", "s" }, "<c-n>", function()
    require("luasnip").change_choice(1)
end, attach_opts)
vim.keymap.set({ "i", "s" }, "<c-p>", function()
    require("luasnip").change_choice(-1)
end, attach_opts)
vim.keymap.set({ "i", "s" }, "<c-j>", function()
    require("luasnip").jump(1)
end, attach_opts)
vim.keymap.set({ "i", "s" }, "<c-k>", function()
    require("luasnip").jump(-1)
end, attach_opts)
