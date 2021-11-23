local map = require("utils").map
local keymap = vim.api.nvim_set_keymap
local cmd = vim.cmd
local fn = vim.fn

-- URL handling
if vim.fn.has "mac" == 1 then
    map[""].gx = { '<Cmd>call jobstart(["open", expand("<cfile>")], {"detach": v:true})<CR>' }
elseif vim.fn.has "unix" == 1 then
    map[""].gx = { '<Cmd>call jobstart(["xdg-open", expand("<cfile>")], {"detach": v:true})<CR>' }
else
    map[""].gx = { '<Cmd>lua print("Error: gx is not supported on this OS!")<CR>' }
end

--- Commands to troubleshoot LSP{{{
--- :lua print(vim.inspect(vim.lsp.buf_get_clients()))
--- :lua vim.cmd('e'..vim.lsp.get_log_path())
--- :LspInfo
--- Set log level to debug:
--- vim.lsp.set_log_level("debug")}}}

function Show_documentation()
    if fn.index({ "vim", "help" }, vim.bo.filetype) >= 0 then
        cmd("h " .. vim.fn.expand "<cword>")
    else
        cmd 'lua require"lspsaga.hover".render_hover_doc()'
    end
end

local opts = { noremap = true, silent = true }
keymap("n", "K", "<CMD>lua Show_documentation()<CR>", opts)
keymap("n", "<Space>to", '<cmd>lua require"lspsaga.floaterm".open_float_terminal()<CR>', opts)
keymap("t", "<Space>tc", '<C-\\><C-n> :lua require"lspsaga.floaterm".close_float_terminal()<CR>', opts)

--- luasnip keymappings
keymap("i", "<c-n>", "<cmd>lua require'luasnip'.change_choice(1)<CR>", opts)
keymap("s", "<c-n>", "<cmd>lua require'luasnip'.change_choice(1)<CR>", opts)
keymap("i", "<c-p>", "<cmd>lua require'luasnip'.change_choice(-1)<CR>", opts)
keymap("s", "<c-p>", "<cmd>lua require'luasnip'.change_choice(-1)<CR>", opts)

keymap("i", "<c-j>", "<cmd>lua require'luasnip'.jump(1)<CR>", opts)
keymap("s", "<c-j>", "<cmd>lua require'luasnip'.jump(1)<CR>", opts)
keymap("i", "<c-k>", "<cmd>lua require'luasnip'.jump(-1)<CR>", opts)
keymap("s", "<c-k>", "<cmd>lua require'luasnip'.jump(-1)<CR>", opts)
