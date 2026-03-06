-- Neovim LSP configuration without Mason (binaries managed via Nix)
-- Migrated to vim.lsp.config() API (Neovim 0.11+)

return {
    {
        "neovim/nvim-lspconfig",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            "b0o/schemastore.nvim",
        },
        config = function()
            local schemastore = require "schemastore"
            local dotnix_root = vim.fs.normalize(vim.fn.expand "~/dotnix")

            local function make_capabilities()
                local capabilities = vim.lsp.protocol.make_client_capabilities()
                local blink_ok, blink = pcall(require, "blink.cmp")

                if blink_ok then
                    capabilities = blink.get_lsp_capabilities(capabilities)
                end

                capabilities.textDocument.foldingRange = {
                    dynamicRegistration = false,
                    lineFoldingOnly = true,
                }

                return capabilities
            end

            local capabilities = make_capabilities()

            vim.diagnostic.config {
                severity_sort = true,
                underline = true,
                update_in_insert = false,
                virtual_text = false,
                float = {
                    border = "rounded",
                    source = "if_many",
                },
            }

            vim.lsp.config("*", {
                capabilities = capabilities,
            })

            local function on_attach(client, bufnr)
                require("lsp.utils").custom_on_init()
                require("lsp.utils").custom_on_attach(client, bufnr)
            end

            local function is_dotnix_workspace(root_dir)
                if not root_dir or root_dir == "" then
                    return false
                end

                local normalized = vim.fs.normalize(root_dir)
                return normalized == dotnix_root or normalized:sub(1, #dotnix_root + 1) == dotnix_root .. "/"
            end

            local function nixd_settings(root_dir)
                local settings = {
                    nixd = {
                        formatting = { command = { "nixfmt" } },
                        nixpkgs = {
                            expr = "import <nixpkgs> { }",
                        },
                    },
                }

                if is_dotnix_workspace(root_dir) then
                    local flake = string.format("%q", dotnix_root)
                    settings.nixd.options = {
                        nixos = {
                            expr = string.format("(builtins.getFlake %s).nixosConfigurations.nz.options", flake),
                        },
                        home_manager = {
                            expr = string.format("(builtins.getFlake %s).homeConfigurations.\"sab@nz\".options", flake),
                        },
                    }
                end

                return settings
            end

            -- Helper function to setup servers with common config
            local function setup_server(name, opts)
                opts = opts or {}
                local server_on_attach = opts.on_attach
                opts.on_attach = function(client, bufnr)
                    on_attach(client, bufnr)

                    if server_on_attach then
                        server_on_attach(client, bufnr)
                    end
                end
                opts.capabilities = vim.tbl_deep_extend("force", {}, capabilities, opts.capabilities or {})
                vim.lsp.config(name, opts)
                vim.lsp.enable(name)
            end

            -- JSON Language Server with schema support
            setup_server("jsonls", {
                settings = {
                    json = {
                        format = { enable = true },
                        validate = { enable = true },
                    },
                },
                on_new_config = function(new_config)
                    new_config.settings.json.schemas = new_config.settings.json.schemas or {}
                    vim.list_extend(new_config.settings.json.schemas, schemastore.json.schemas())
                end,
            })

            -- YAML Language Server with schema support
            setup_server("yamlls", {
                settings = {
                    yaml = {
                        format = { enable = true },
                        validate = true,
                        keyOrdering = false,
                        schemaStore = { enable = false, url = "" },
                    },
                    redhat = { telemetry = { enabled = false } },
                },
                on_new_config = function(new_config)
                    new_config.settings.yaml.schemas = vim.tbl_deep_extend(
                        "force",
                        new_config.settings.yaml.schemas or {},
                        schemastore.yaml.schemas()
                    )
                end,
            })

            -- Markdown Language Server
            setup_server("marksman", {
                cmd = { "marksman", "server" },
            })

            -- Lua Language Server
            setup_server("lua_ls", {
                on_attach = function(client)
                    client.server_capabilities.documentFormattingProvider = false
                    client.server_capabilities.documentRangeFormattingProvider = false
                end,
                settings = {
                    Lua = {
                        workspace = { checkThirdParty = false },
                        completion = { callSnippet = "Replace" },
                        hint = { enable = true },
                        telemetry = { enable = false },
                    },
                },
            })

            -- Nix Language Server
            setup_server("nixd", {
                cmd = { "nixd" },
                on_attach = function(client)
                    client.server_capabilities.documentFormattingProvider = false
                    client.server_capabilities.documentRangeFormattingProvider = false
                end,
                settings = nixd_settings(),
                on_new_config = function(new_config, root_dir)
                    new_config.settings = nixd_settings(root_dir)
                end,
            })

            -- Simple servers with default configurations
            local simple_servers = {
                "terraformls", -- Terraform
                "pyright", -- Python type checker
                "helm_ls", -- Helm templates
            }

            for _, server in ipairs(simple_servers) do
                setup_server(server)
            end

            setup_server("ruff", {
                on_attach = function(client)
                    client.server_capabilities.hoverProvider = false
                end,
            })
        end,
    },
}
