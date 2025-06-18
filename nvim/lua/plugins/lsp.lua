return {
    {
        "neovim/nvim-lspconfig",
        event = "BufReadPre",
        dependencies = {
            { "saghen/blink.cmp" },
            {
                "folke/lazydev.nvim",
                ft = "lua",
                opts = {
                    library = {
                        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
                        { path = "snacks.nvim", words = { "Snacks" } },
                    },
                },
            },
            "mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            -- "hrsh7th/cmp-nvim-lsp",
            "b0o/schemastore.nvim", -- For JSON/YAML schemas
            version = false,
        },
        opts = {
            diagnostics = {
                underline = true,
                update_in_insert = false,
                virtual_text = { spacing = 4, prefix = "●" },
                severity_sort = true,
            },
            servers = {
                jsonls = {
                    on_new_config = function(new_config)
                        new_config.settings.json.schemas = new_config.settings.json.schemas or {}
                        vim.list_extend(new_config.settings.json.schemas, require("schemastore").json.schemas())
                    end,
                    settings = {
                        json = {
                            format = { enable = true },
                            validate = { enable = true },
                        },
                    },
                },
                terraformls = {},
                helm_ls = {},
                yamlls = {
                    on_new_config = function(new_config)
                        new_config.settings.yaml.schemas = vim.tbl_deep_extend(
                            "force",
                            new_config.settings.yaml.schemas or {},
                            require("schemastore").yaml.schemas()
                        )
                    end,
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
                            format = { enable = true },
                            validate = true,
                            schemaStore = {
                                enable = false,
                                url = "",
                            },
                        },
                    },
                },
            },
            setup = {
                yamlls = function()
                    -- For nvim < 0.10, force formatting capability
                    if vim.fn.has "nvim-0.10" == 0 then
                        require("lsp.utils").lsp.on_attach(function(client, _)
                            client.server_capabilities.documentFormattingProvider = true
                        end, "yamlls")
                    end
                end,
            },
        },
        config = function(plugin, opts)
            -- Set up formatting and keymaps for all LSPs
            require("lsp.utils").on_attach(function(client, buffer)
                require("lsp.utils").custom_on_init()
                require("lsp.utils").custom_on_attach(client, buffer)
            end)

            local servers = opts.servers
            local capabilities = require("blink.cmp").get_lsp_capabilities()

            -- Make sure all your servers are installed
            require("mason-lspconfig").setup {
                ensure_installed = vim.tbl_keys(servers),
            }

            -- Setup each LSP server in your config table
            for server, server_opts in pairs(servers) do
                server_opts.capabilities = capabilities
                -- Custom setup logic via `opts.setup`
                if opts.setup and opts.setup[server] then
                    if opts.setup[server](server, server_opts) then
                        goto continue
                    end
                elseif opts.setup and opts.setup["*"] then
                    if opts.setup["*"](server, server_opts) then
                        goto continue
                    end
                end
                require("lspconfig")[server].setup(server_opts)
                ::continue::
            end

            -- Manual, one-off LSP setups
            require("lspconfig")["helm_ls"].setup {}
            require("lspconfig").nixd.setup {
                cmd = { "nixd" },
                settings = {
                    nixd = {
                        nixpkgs = {
                            expr = "import (builtins.getFlake(toString ./.)).inputs.nixpkgs { }",
                        },
                        formatting = { command = { "alejandra" } },
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
            }
            require("lspconfig")["marksman"].setup { cmd = { "marksman", "server" } }
            require("lspconfig")["lua_ls"].setup {
                settings = {
                    Lua = {
                        workspace = { checkThirdParty = false },
                        completion = { callSnippet = "Replace" },
                    },
                },
            }
        end,
    },

    -- Mason setup for installing LSP binaries and tools
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
