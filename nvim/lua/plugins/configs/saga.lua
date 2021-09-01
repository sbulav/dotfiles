--[[ local saga = require 'lspsaga'
saga.init_lsp_saga() ]]

local M = {}

M.setup = function()
  require('lspsaga').init_lsp_saga()
end

return M
