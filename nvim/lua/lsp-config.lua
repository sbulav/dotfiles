local nvim_lsp = require'nvim_lsp'
local completion = require('completion')

local mapper = function(mode, key, result)
  vim.fn.nvim_buf_set_keymap(0, mode, key, result, {noremap=true, silent=true})
  completion.on_attach(client)
end

if vim.api.nvim_buf_get_option(0, 'filetype') ~= 'lua' then
  mapper('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>')
end

local custom_attach = function(client)
  -- require'lsp_status'.on_attach(client)
  require'diagnostic'.on_attach({
    -- enable_virtual_text = 1,
    -- virtual_text_prefix = 'F',
  })
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

  mapper('n', '<leader>e', ':OpenDiagnostic<CR>')
  mapper('n', '[e', ':NextDiagnostic<CR>')
  mapper('n', ']e', ':PrevDiagnostic<CR>')
end

nvim_lsp.pyls.setup{
  on_attach = custom_attach;
}

nvim_lsp.terraformls.setup{
  on_attach = custom_attach;
}
