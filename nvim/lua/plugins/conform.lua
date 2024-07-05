-- formatters
return {
    "stevearc/conform.nvim",
    event = "BufRead",
    config = function()
        require("conform").setup {
            format_after_save = function(bufnr)
                -- Disable with a global or buffer-local variable
                if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
                    return
                end
                return { async = true, timeout_ms = 500, lsp_fallback = true }
            end,
            formatters_by_ft = {
                lua = { "stylua" },
                nix = { "alejandra" },
            },
        }
    end,
}
