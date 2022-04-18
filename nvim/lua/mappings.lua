local attach_opts = { silent = true }
-- lsp provider to find the cursor word definition and reference
-- URL handling
if vim.fn.has "mac" == 1 then
    vim.keymap.set("n", "gx", '<Cmd>call jobstart(["open", expand("<cfile>")], {"detach": v:true})<CR>', attach_opts)
elseif vim.fn.has "unix" == 1 then
    vim.keymap.set(
        "n",
        "gx",
        '<Cmd>call jobstart(["xdg-open", expand("<cfile>")], {"detach": v:true})<CR>',
        attach_opts
    )
else
    vim.keymap.set("n", "gx", function()
        print "Error: gx is not supported on this OS!"
    end, attach_opts)
end

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
