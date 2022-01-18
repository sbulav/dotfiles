-- try to import lspconfig
local lspconfig = prequire "lspconfig"
if not lspconfig then
  return
end
local utils = require "utils"

-- tell lsp about nvim-cmp
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)

utils.info("Initilizing LSP server in containers", "LSP")
require("lspconfig").pyright.setup {
  before_init = function(params)
    params.processId = vim.NIL
  end,
  on_init = require("lsp.utils").custom_on_init,
  on_attach = require("lsp.utils").on_attach,
  capabilites = capabilities,
  cmd = require("lspcontainers").command "pyright",
  root_dir = lspconfig.util.root_pattern(".git", vim.fn.getcwd()),

  handlers = {
    -- pyright ignores dynamicRegistration settings
    ["client/registerCapability"] = function(_, _, _, _)
      return {
        result = nil,
        error = nil,
      }
    end,
  },
}

require("lspconfig").terraformls.setup {
  on_init = require("lsp.utils").custom_on_init,
  on_attach = require("lsp.utils").on_attach,
  cmd = require("lspcontainers").command "terraformls",
  filetypes = { "hcl", "tf", "terraform", "tfvars" },
  capabilites = capabilities,
}

require("lspconfig").tsserver.setup {
  before_init = function(params)
    params.processId = vim.NIL
  end,
  on_init = require("lsp.utils").custom_on_init,
  on_attach = require("lsp.utils").on_attach,
  capabilites = capabilities,
  cmd = require("lspcontainers").command "tsserver",
  root_dir = lspconfig.util.root_pattern(".git", vim.fn.getcwd()),
}
require("nlua.lsp.nvim").setup(require "lspconfig", {
  on_init = require("lsp.utils").custom_on_init,
  on_attach = require("lsp.utils").on_attach,
  capabilites = capabilities,
  -- Include globals you want to tell the LSP are real :)
  globals = {
    -- Colorbuddy
    "Color",
    "c",
    "Group",
    "g",
    "s",
  },
})
