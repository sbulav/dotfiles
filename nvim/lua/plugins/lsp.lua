-- Neovim LSP configuration without Mason (binaries managed via Nix)
-- Ensure plugin is loaded on require via module trigger

return {
    {
        "neovim/nvim-lspconfig",
        module = { "lspconfig", "cmp_nvim_lsp" },
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            "hrsh7th/nvim-cmp",
            "hrsh7th/cmp-nvim-lsp",
            "saghen/blink.cmp",
            "b0o/schemastore.nvim",
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
        },
        config = function()
            local lspconfig = require "lspconfig"
            local cmp_nvim_lsp = require "cmp_nvim_lsp"

            -- Common on_attach and capabilities
            local on_attach = function(client, bufnr)
                require("lsp.utils").custom_on_init()
                require("lsp.utils").custom_on_attach(client, bufnr)
            end

            local capabilities = cmp_nvim_lsp.default_capabilities()

            -- List of servers to configure
            local servers = {
                jsonls = {
                    settings = {
                        json = { format = { enable = true }, validate = { enable = true } },
                    },
                    on_new_config = function(new_config)
                        new_config.settings.json.schemas = new_config.settings.json.schemas or {}
                        vim.list_extend(new_config.settings.json.schemas, require("schemastore").json.schemas())
                    end,
                },
                yamlls = {
                    settings = {
                        yaml = {
                            format = { enable = true },
                            validate = true,
                            keyOrdering = false,
                            schemaStore = { enable = false, url = "" },
                        },
                        redhat = { telemetry = { enabled = false } },
                    },
                    capabilities = {
                        textDocument = { foldingRange = { dynamicRegistration = false, lineFoldingOnly = true } },
                    },
                    on_new_config = function(new_config)
                        new_config.settings.yaml.schemas = vim.tbl_deep_extend(
                            "force",
                            new_config.settings.yaml.schemas or {},
                            require("schemastore").yaml.schemas()
                        )
                    end,
                },
                terraformls = {},
                pyright = {},
                ruff = {},
                helm_ls = {},
                marksman = { cmd = { "marksman", "server" } },
                lua_ls = {
                    settings = {
                        Lua = { workspace = { checkThirdParty = false }, completion = { callSnippet = "Replace" } },
                    },
                },
                nixd = {
                    cmd = { "nixd" },
                    settings = {
                        nixd = {
                            formatting = { command = { "alejandra" } },
                            nixpkgs = { expr = "import (builtins.getFlake(toString ./.)).inputs.nixpkgs {}" },
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
            }

            -- Apply configuration per server
            for name, opts in pairs(servers) do
                opts.on_attach = on_attach
                opts.capabilities = capabilities
                local handled = false
                if opts.setup then
                    handled = opts.setup(name, opts)
                end
                if not handled then
                    lspconfig[name].setup(opts)
                end
            end
        end,
    },
}
