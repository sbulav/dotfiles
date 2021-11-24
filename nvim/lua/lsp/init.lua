vim.lsp.set_log_level "info"

-- try to import lspconfig
local lspconfig = prequire "lspconfig"
if not lspconfig then
    return
end


-- set diagnostics to update in insert mode
vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
  virtual_text = true,
  signs = true,
  underline = true,
  update_in_insert = true,
})

if vim.fn.has "mac" == 1 then
  require('lsp.servers-mac')
elseif vim.fn.has "unix" == 1 then
  require('lsp.servers-linux')
end
