local lspconfig = prequire "lspconfig"
if not lspconfig then
    return
end

-- tell lsp about nvim-cmp
local capabilities = vim.lsp.protocol.make_client_capabilities()
local cmp_nvim_lsp_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if cmp_nvim_lsp_ok then
    capabilities = cmp_nvim_lsp.update_capabilities(vim.lsp.protocol.make_client_capabilities())
end

lspconfig.pyright.setup {
    on_init = require("lsp.utils").custom_on_init,
    on_attach = require("lsp.utils").on_attach,
    capabilites = capabilities,
    autostart = true,
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

lspconfig.terraformls.setup {
    on_init = require("lsp.utils").custom_on_init,
    on_attach = require("lsp.utils").on_attach,
    filetypes = { "hcl", "tf", "terraform", "tfvars" },
    capabilites = capabilities,
}

-- NOTE: This replaces the calls where you would have before done `require('nvim_lsp').sumneko_lua.setup()`
require("nlua.lsp.nvim").setup(require "lspconfig", {
    on_init = require("lsp.utils").custom_on_init,
    on_attach = require("lsp.utils").on_attach,
    capabilities = capabilities,

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

lspconfig.tsserver.setup {
    on_init = require("lsp.utils").custom_on_init,
    on_attach = require("lsp.utils").on_attach,
    capabilites = capabilities,
}

lspconfig.gopls.setup {
    on_init = require("lsp.utils").custom_on_init,
    on_attach = require("lsp.utils").on_attach,
    capabilites = capabilities,
}
