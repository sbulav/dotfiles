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
  local keymap = vim.api.nvim_set_keymap
  -- lsp provider to find the cursor word definition and reference
  keymap('n', 'gh', '<cmd>lua require"lspsaga.provider".lsp_finder()<CR>', opts)
  -- code action
  keymap('n', 'gA', '<cmd>lua require"lspsaga.codeaction".code_action()<CR>', opts)
  -- show function signature help
  keymap('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  -- rename
  keymap('n', 'gr', '<cmd>lua require"lspsaga.rename".rename()<CR>', opts)
  -- preview definition
  keymap('n', 'gD', '<cmd>lua require"lspsaga.provider".preview_definition()<CR>', opts)
  -- go to implementation
  keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  -- show line diagnostic
  keymap('n', 'gd','<cmd>lua require"lspsaga.diagnostic".show_line_diagnostics()<CR>', opts)
  -- jump diagnostic
  keymap('n', '[e', '<cmd>lua require"lspsaga.diagnostic".lsp_jump_diagnostic_prev()<CR>', opts)
  keymap('n', ']e', '<cmd>lua require"lspsaga.diagnostic".lsp_jump_diagnostic_next()<CR>', opts)
  -- manage git worktree
  keymap('n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  keymap('n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  keymap('n', '<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  keymap('n', '<leader>so', [[<cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>]], opts)
  vim.cmd [[ command! Format execute 'lua vim.lsp.buf.formatting()' ]]
end

if vim.fn.has("mac") == 1 then
  lspconfig.pyright.setup{
    on_init = custom_on_init,
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
