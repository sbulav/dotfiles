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

local options = {
    on_init = require("lsp.utils").custom_on_init,
    on_attach = require("lsp.utils").on_attach,
    capabilities = capabilities,
}

local servers = {
    jsonls = {
        settings = {
            json = {
                format = {
                    enable = true,
                },
                schemas = require("schemastore").json.schemas(),
                validate = { enable = true },
            },
        },
    },
    pyright = {},
    terraformls = {},
    yamlls = {
        settings = {
            yaml = {
                schemas = {
                    ["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
                    ["https://kubernetesjsonschema.dev/v1.14.0/deployment-apps-v1.json"] = {
                        "*pod*.yaml",
                        "*deploy*.yaml",
                        "*service*.yaml",
                        "*ingress*.yaml",
                    },
                },
            },
        },
    },
    sumneko_lua = {
        settings = {
            Lua = {
                -- make the language server recognize "vim" global
                diagnostics = {
                    globals = { "vim" },
                },
                workspace = {
                    -- make language server aware of runtime files
                    library = {
                        [vim.fn.expand "$VIMRUNTIME/lua"] = true,
                        [vim.fn.stdpath "config" .. "/lua"] = true,
                    },
                },
            },
        },
    },
}

for server, opts in pairs(servers) do
    opts = vim.tbl_deep_extend("force", {}, options, opts or {})
    require("lspconfig")[server].setup(opts)
end
