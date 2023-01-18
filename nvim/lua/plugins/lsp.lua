return {
    {
        "neovim/nvim-lspconfig",
        event = "BufReadPre",
        dependencies = {
            "mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            "hrsh7th/cmp-nvim-lsp",
            -- jsonls schemas
            "b0o/schemastore.nvim",
            "tami5/lspsaga.nvim",
        },
        ---@class PluginLspOpts
        opts = {
            diagnostics = {
                underline = true,
                update_in_insert = false,
                virtual_text = { spacing = 4, prefix = "●" },
                severity_sort = true,
            },
            ---@type lspconfig.options
            servers = {
                jsonls = {
                    -- lazy-load schemastore when needed
                    on_new_config = function(new_config)
                        new_config.settings.json.schemas = new_config.settings.json.schemas or {}
                        vim.list_extend(new_config.settings.json.schemas, require("schemastore").json.schemas())
                    end,
                    settings = {
                        json = {
                            format = {
                                enable = true,
                            },
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
                                ["https://kubernetesjsonschema.dev/v1.18.0/deployment-apps-v1.json"] = {
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
                                checkThirdParty = false,
                            },
                            library = {
                                [vim.fn.expand "$VIMRUNTIME/lua"] = true,
                                [vim.fn.stdpath "config" .. "/lua"] = true,
                            },

                            completion = {
                                callSnippet = "Replace",
                            },
                        },
                    },
                },
            },
            -- you can do any additional lsp server setup here
            -- return true if you don't want this server to be setup with lspconfig
            ---@type table<string, fun(server:string, opts:_.lspconfig.options):boolean?>
            setup = {
                -- example to setup with typescript.nvim
                -- tsserver = function(_, opts)
                --   require("typescript").setup({ server = opts })
                --   return true
                -- end,
                -- Specify * to use this function as a fallback for any server
                -- ["*"] = function(server, opts) end,
            },
        },
        ---@param opts PluginLspOpts
        config = function(plugin, opts)
            -- setup formatting and keymaps
            require("lsp.utils").on_attach(function(client, buffer)
                require("lsp.utils").custom_on_init()
                require("lsp.utils").custom_on_attach(client, buffer)
                require("lsp.formatting").custom_on_attach(client, buffer)
            end)

            local servers = opts.servers
            local capabilities =
                require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

            require("mason-lspconfig").setup { ensure_installed = vim.tbl_keys(servers) }
            require("mason-lspconfig").setup_handlers {
                function(server)
                    local server_opts = servers[server] or {}
                    server_opts.capabilities = capabilities
                    if opts.setup[server] then
                        if opts.setup[server](server, server_opts) then
                            return
                        end
                    elseif opts.setup["*"] then
                        if opts.setup["*"](server, server_opts) then
                            return
                        end
                    end
                    require("lspconfig")[server].setup(server_opts)
                end,
            }
        end,
    },

    -- -- formatters
    {
        "jose-elias-alvarez/null-ls.nvim",
        event = "BufReadPre",
        dependencies = { "mason.nvim" },
        opts = function()
            local nls = require "null-ls"
            return {
                sources = {
                    nls.builtins.diagnostics.flake8,
                    nls.builtins.formatting.gofmt,
                    nls.builtins.formatting.goimports,
                    nls.builtins.formatting.stylua,
                },
                on_attach = require("lsp.utils").custom_on_attach,
            }
        end,
    },

    -- cmdline tools and lsp servers
    {

        "williamboman/mason.nvim",
        cmd = "Mason",
        opts = {
            ensure_installed = {
                "flake8",
                "black",
                "isort",
                "shellcheck",
                "shfmt",
                "prettierd",
                "eslint_d",
                "goimports",
                "gopls",
                "jq",
                "json-lsp",
                "jsonnet-language-server",
                "lua-language-server",
                "pyright",
                "stylua",
                "terraform-ls",
                "yaml-language-server",
            },
        },
        ---@param opts MasonSettings | {ensure_installed: string[]}
        config = function(plugin, opts)
            require("mason").setup(opts)
            local mr = require "mason-registry"
            for _, tool in ipairs(opts.ensure_installed) do
                local p = mr.get_package(tool)
                if not p:is_installed() then
                    p:install()
                end
            end
        end,
    },
}
