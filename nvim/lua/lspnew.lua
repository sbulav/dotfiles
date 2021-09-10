-- try to import lspconfig
local lspconfig = prequire("lspconfig")
if not lspconfig then
    return
end

-- tell lsp about nvim-cmp
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)

local function custom_on_init()
    print('Language Server Protocol started!')
end

vim.lsp.set_log_level("info")

local on_attach = function(_, bufnr)
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  local opts = { noremap = true, silent = true }
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  -- vim.api.nvim_buf_set_keymap(bufnr, 'v', '<leader>ca', '<cmd>lua vim.lsp.buf.range_code_action()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>so', [[<cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>]], opts)
  vim.cmd [[ command! Format execute 'lua vim.lsp.buf.formatting()' ]]
end
-- lspconfig.sumneko_lua.setup(luadev)

if vim.fn.has("mac") == 1 then
  lspconfig.pyright.setup{
    -- on_init = custom_on_init,
    on_attach = on_attach,
    capabilites = capabilities,
    autostart = true,
    handlers = {
      -- pyright ignores dynamicRegistration settings
      ['client/registerCapability'] = function(_, _, _, _)
        return {
          result = nil;
          error = nil;
        }
      end
    };
  }

  lspconfig.terraformls.setup{
    on_init = custom_on_init,
    on_attach = on_attach,
    capabilites = capabilities,
  }

  -- NOTE: This replaces the calls where you would have before done `require('nvim_lsp').sumneko_lua.setup()`
  require('nlua.lsp.nvim').setup(require('lspconfig'), {
    on_init = custom_on_init,
    on_attach = on_attach,
    capabilities = capabilities,

    -- Include globals you want to tell the LSP are real :)
    globals = {
      -- Colorbuddy
      "Color", "c", "Group", "g", "s",
    }
  })

  lspconfig.tsserver.setup{
    on_init = custom_on_init,
    on_attach = on_attach,
    capabilites = capabilities,
  }

elseif vim.fn.has("unix") == 1 then 
  print('Initializing langservers in containers')
  require'lspconfig'.pyright.setup {
    before_init = function(params)
      params.processId = vim.NIL
    end,
    on_init = custom_on_init,
    on_attach = on_attach,
    capabilites = capabilities,
    cmd = require'lspcontainers'.command('pyright'),
    root_dir = lspconfig.util.root_pattern(".git", vim.fn.getcwd()),

    handlers = {
      -- pyright ignores dynamicRegistration settings
      ['client/registerCapability'] = function(_, _, _, _)
        return {
          result = nil;
          error = nil;
        }
      end
    };
  }

  require'lspconfig'.terraformls.setup {
    cmd = require'lspcontainers'.command('terraformls'),
    filetypes = { "hcl", "tf", "terraform", "tfvars" },
    on_init = custom_on_init,
    on_attach = on_attach,
    capabilites = capabilities,
  }

  require'lspconfig'.tsserver.setup {
    before_init = function(params)
      params.processId = vim.NIL
    end,
    on_init = custom_on_init,
    on_attach = on_attach,
    capabilites = capabilities,
    cmd = require'lspcontainers'.command('tsserver'),
    root_dir = lspconfig.util.root_pattern(".git", vim.fn.getcwd()),
  }
  require('nlua.lsp.nvim').setup(require('lspconfig'), {
    on_init = custom_on_init,
    on_attach = on_attach,
    capabilites = capabilities,
    -- Include globals you want to tell the LSP are real :)
    globals = {
      -- Colorbuddy
      "Color", "c", "Group", "g", "s",
    }})
end
