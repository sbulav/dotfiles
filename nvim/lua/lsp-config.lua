local lspconfig = require'lspconfig'
local completion = require('completion')

local mapper = function(mode, key, result)
  vim.fn.nvim_buf_set_keymap(0, mode, key, result, {noremap=true, silent=true})
  completion.on_attach(client)
end

-- Enable/disable specific diagnostics features
-- :h vim.lsp.diagnostic.on_publish_diagnostics()
vim.lsp.handlers["textDocument/publishDiagnostics"] =
  vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics,
  {
    underline = true,
    virtual_text = true,
    signs = true,
    update_in_insert = false
  }
)

-- Customize diagnostics signs
local function set_sign(type, icon)
  local sign = string.format("LspDiagnosticsSign%s", type)
  local texthl = string.format("LspDiagnosticsDefault%s", type)
  vim.fn.sign_define(sign, {text = icon, texthl = texthl})
end

set_sign("Hint", "➤")
set_sign("Information", "ℹ")
set_sign("Warning", "⚠")
set_sign("Error", "✖")

if vim.api.nvim_buf_get_option(0, 'filetype') ~= 'lua' then
  mapper('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>')
end

local custom_attach = function(client)
  -- require'lsp_status'.on_attach(client)
  require'completion'.on_attach({
    sorting = 'alphabet',
    matching_strategy_list = {'exact', 'fuzzy'},
    -- chain_complete_list = chain_complete_list,
  })
  mapper('n', 'gd', '<cmd>lua vim.lsp.buf.declaration()<CR>')
  mapper('n', '<c-]>', '<cmd>lua vim.lsp.buf.definition()<CR>')
  mapper('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>')
  mapper('n', 'gD', '<cmd>lua vim.lsp.buf.implementation()<CR>')
  mapper('n', '1gD', '<cmd>lua vim.lsp.buf.type_definition()<CR>')
  mapper('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>')
  mapper('n', 'g0', '<cmd>lua vim.lsp.buf.document_symbol()<CR>')
  mapper('i', '<c-l>', '<cmd>lua vim.lsp.buf.signature_help()<CR>')

  mapper('n', '<leader>e', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>')
  mapper('n', '[e', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>')
  mapper('n', ']e', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>')
end

lspconfig.pyls.setup{
  on_attach = custom_attach;
}

lspconfig.terraformls.setup{
  on_attach = custom_attach;
}
