return {
    {
        "neovim/nvim-lspconfig",
        event = "BufReadPre",
        dependencies = {
            { "saghen/blink.cmp" },
            { "folke/lazydev.nvim", ft = "lua", opts = {} },
            "mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            -- "hrsh7th/cmp-nvim-lsp",
            -- jsonls schemas
            "b0o/schemastore.nvim",
            version = false, -- last release is way too old
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
                -- pyright = {},
                -- terraformls = {},
                helm_ls = {},
                yamlls = {
                    -- lazy-load schemastore when needed
                    on_new_config = function(new_config)
                        new_config.settings.yaml.schemas = vim.tbl_deep_extend(
                            "force",
                            new_config.settings.yaml.schemas or {},
                            require("schemastore").yaml.schemas()
                        )
                    end,
                    -- Have to add this for yamlls to understand that we support line folding
                    capabilities = {
                        textDocument = {
                            foldingRange = {
                                dynamicRegistration = false,
                                lineFoldingOnly = true,
                            },
                        },
                    },

                    settings = {
                        redhat = { telemetry = { enabled = false } },
                        yaml = {
                            keyOrdering = false,
                            format = {
                                enable = true,
                            },
                            validate = true,
                            schemaStore = {
                                -- Must disable built-in schemaStore support to use
                                -- schemas from SchemaStore.nvim plugin
                                enable = false,
                                -- Avoid TypeError: Cannot read properties of undefined (reading 'length')
                                url = "",
                            },
                        },
                    },
                },
            },
            -- you can do any additional lsp server setup here
            -- return true if you don't want this server to be setup with lspconfig
            ---@type table<string, fun(server:string, opts:_.lspconfig.options):boolean?>
            setup = {
                yamlls = function()
                    -- Neovim < 0.10 does not have dynamic registration for formatting
                    if vim.fn.has "nvim-0.10" == 0 then
                        require("lsp.utils").lsp.on_attach(function(client, _)
                            client.server_capabilities.documentFormattingProvider = true
                        end, "yamlls")
                    end
                end,
            },
        },
        ---@param opts PluginLspOpts
        config = function(plugin, opts)
            -- setup formatting and keymaps
            require("lsp.utils").on_attach(function(client, buffer)
                require("lsp.utils").custom_on_init()
                require("lsp.utils").custom_on_attach(client, buffer)
            end)

            local servers = opts.servers
            -- local capabilities = require("blink.cmp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
            local capabilities = require("blink.cmp").get_lsp_capabilities()

            require("mason-lspconfig").setup {}
            -- require("mason-lspconfig").setup { ensure_installed = vim.tbl_keys(servers) }
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
                -- manually configured servers
                require("lspconfig")["helm_ls"].setup {},

                require("lspconfig").nixd.setup {
                    cmd = { "nixd" },
                    settings = {
                        nixd = {
                            nixpkgs = {
                                -- For flake.
                                -- This expression will be interpreted as "nixpkgs" toplevel
                                -- Nixd provides package, lib completion/information from it.
                                -- Resource Usage: Entries are lazily evaluated, entire nixpkgs takes 200~300MB for just "names".
                                -- Package documentation, versions, are evaluated by-need.
                                expr = "import (builtins.getFlake(toString ./.)).inputs.nixpkgs { }",
                            },
                            formatting = {
                                command = { "alejandra" }, -- or nixfmt or nixpkgs-fmt
                            },
                            options = {
                                nixos = {
                                    expr = "let flake = builtins.getFlake(toString ./.); in flake.nixosConfigurations.nz.options",
                                },
                                home_manager = {
                                    expr = 'let flake = builtins.getFlake(toString ./.); in flake.homeConfigurations."sab@mbp16".options',
                                },
                                darwin = {
                                    expr = "let flake = builtins.getFlake(toString ./.); in flake.darwinConfigurations.mbp16.options",
                                },
                            },
                        },
                    },
                },
                require("lspconfig")["marksman"].setup { cmd = { "marksman", "server" } },

                require("lspconfig")["lua_ls"].setup {
                    settings = {
                        Lua = {
                            -- -- make the language server recognize "vim" global
                            -- diagnostics = {
                            --     globals = { "vim" },
                            -- },

                            workspace = {
                                checkThirdParty = false,
                            },
                            -- library = {
                            --     [vim.fn.expand "$VIMRUNTIME/lua"] = true,
                            --     [vim.fn.stdpath "config" .. "/lua"] = true,
                            -- },

                            completion = {
                                callSnippet = "Replace",
                            },
                        },
                    },
                },
            }
        end,
    },

    -- cmdline tools and lsp servers
    {

        "williamboman/mason.nvim",
        cmd = "Mason",
        opts = {
            ensure_installed = {
                "eslint_d",
                "flake8",
                "goimports",
                "gopls",
                "isort",
                "jq",
                "json-lsp",
                "jsonnet-language-server",
                "prettierd",
                "shfmt",
                "terraform-ls",
                "yaml-language-server",
                -- Managed via Nix, DO NOT INSTALL IN MASON
                -- "stylua",
                -- "alejandra",
                -- "pyright",
                -- "black",
                -- "marksman",
                -- "nixd"
                "lua-language-server",
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
