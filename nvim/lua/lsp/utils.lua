local M = {}
local utils = require "utils"

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
function M.on_attach(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

  local opts = { noremap = true, silent = true }
  local keymap = vim.api.nvim_set_keymap

  -- lsp provider to find the cursor word definition and reference
  keymap("n", "gh", '<cmd>lua require"lspsaga.provider".lsp_finder()<CR>', opts)
  -- code action
  keymap("n", "ga", '<cmd>lua require"lspsaga.codeaction".code_action()<CR>', opts)
  keymap("n", "gA", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)

  -- show function signature help
  keymap("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
  -- rename
  keymap("n", "gr", '<cmd>lua require"lspsaga.rename".rename()<CR>', opts)
  -- preview definition
  keymap("n", "gD", '<cmd>lua require"lspsaga.provider".preview_definition()<CR>', opts)
  -- go to implementation
  keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
  -- go to definition
  keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
  -- show line diagnostic
  keymap("n", "ge", '<cmd>lua require"lspsaga.diagnostic".show_line_diagnostics()<CR>', opts)
  -- jump diagnostic
  keymap("n", "[e", "<cmd>Lspsaga diagnostic_jump_next<cr>", opts)
  keymap("n", "]e", "<cmd>Lspsaga diagnostic_jump_prev<cr>", opts)
  -- manage git worktree
  keymap("n", "<leader>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
  keymap("n", "<leader>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
  keymap("n", "<leader>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", opts)
  keymap("n", "<leader>so", [[<cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>]], opts)
  keymap("n", "<leader>sr", [[<cmd>lua require('telescope.builtin').lsp_buf_references()<CR>]], opts)

  vim.cmd 'command! Format :lua require("lsp.utils").formatDocument()'
  -- client.resolved_capabilities.document_formatting = enable
  --   -- format on save
  --   if client.resolved_capabilities.document_formatting then
  vim.cmd [[
          augroup LspFormat
            autocmd BufWritePre <buffer> lua require("lsp.utils").formatDocument()
          augroup END
          autocmd CursorHold,CursorHoldI * lua require'nvim-lightbulb'.update_lightbulb()
        ]]
  -- end

  -- Disable formatting with other LSPs because we're handling formatting via null-ls
  -- Otherwise you'll be prompted to Select a language server
  if client.name ~= "null-ls" then
    client.resolved_capabilities.document_formatting = false
  end
end

function M.formatDocument()
  -- check if LSP is attached
  if (#vim.lsp.buf_get_clients()) < 1 then
    return
  end

  vim.lsp.buf.formatting_sync(nil, 1500)
end

function M.custom_on_init()
  -- print "Language Server Protocol started!"
  utils.info("Language Server Protocol started!", "LSP")
end

function M.has_formatter(ft)
  local sources = require "null-ls.sources"
  local available = sources.get_available(ft, "NULL_LS_FORMATTING")
  return #available > 0
end

return M
