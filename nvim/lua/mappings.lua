local map = require('utils').map
local keymap = vim.api.nvim_set_keymap
local cmd = vim.cmd
local fn = vim.fn

-- URL handling
if vim.fn.has("mac") == 1 then
  map[''].gx = {'<Cmd>call jobstart(["open", expand("<cfile>")], {"detach": v:true})<CR>'}
elseif vim.fn.has("unix") == 1 then
  map[''].gx = {'<Cmd>call jobstart(["xdg-open", expand("<cfile>")], {"detach": v:true})<CR>'}
else
  map[''].gx = {'<Cmd>lua print("Error: gx is not supported on this OS!")<CR>'}
end


--- Commands to troubleshoot LSP{{{
--- :lua print(vim.inspect(vim.lsp.buf_get_clients()))
--- :lua vim.cmd('e'..vim.lsp.get_log_path())
--- :LspInfo
--- Set log level to debug:
--- vim.lsp.set_log_level("debug")}}}

function Show_documentation()
    if fn.index({'vim', 'help'}, vim.bo.filetype) >= 0 then
        cmd('h ' .. vim.fn.expand('<cword>'))
    else
        cmd('lua require"lspsaga.hover".render_hover_doc()')
    end
end

keymap('n', 'K', '<CMD>lua Show_documentation()<CR>', {noremap = true, silent = true})
keymap('n', '<leader>F', '<CMD>lua vim.lsp.buf.formatting()<CR>', {noremap = true, silent = true})
keymap('v', '<leader>F', '<CMD>lua vim.lsp.buf.formatting()<CR>', {noremap = true, silent = true})
-- lsp provider to find the cursor word definition and reference
keymap('n', 'gh', '<cmd>lua require"lspsaga.provider".lsp_finder()<CR>', {noremap = true, silent = true})
-- code action
keymap('n', 'gA', '<cmd>lua require"lspsaga.codeaction".code_action()<CR>', {noremap = true, silent = true})
-- show signature help
keymap('n', 'gs', '<cmd>lua require"lspsaga.signaturehelp".signature_help()<CR>', {noremap = true, silent = true})
-- rename
keymap('n', 'gr', '<cmd>lua require"lspsaga.rename".rename()<CR>', {noremap = true, silent = true})
-- preview definition
keymap('n', 'gD', '<cmd>lua require"lspsaga.provider".preview_definition()<CR>', {noremap = true, silent = true})
-- show line diagnostic
keymap('n', 'gd','<cmd>lua require"lspsaga.diagnostic".show_line_diagnostics()<CR>', {noremap = true, silent = true})
-- jump diagnostic
keymap('n', '[e', '<cmd>lua require"lspsaga.diagnostic".lsp_jump_diagnostic_prev()<CR>', {noremap = true, silent = true})
keymap('n', ']e', '<cmd>lua require"lspsaga.diagnostic".lsp_jump_diagnostic_next()<CR>', {noremap = true, silent = true})
keymap('n', '<Space>to', '<cmd>lua require"lspsaga.floaterm".open_float_terminal()<CR>', {noremap = true, silent = true})
keymap('t', '<Space>tc', '<C-\\><C-n> :lua require"lspsaga.floaterm".close_float_terminal()<CR>', {noremap = true, silent = true})
