local null_ls = require "null-ls"
local b = null_ls.builtins

local sources = {
    -- formatting
    b.formatting.stylua,
    b.code_actions.gitsigns,
    --   conditional enabling
    --   b.formatting.stylua.with({
    --     condition = function(utils)
    --         return utils.root_has_file("stylua.toml")
    --     end,
    -- }),
    b.formatting.terraform_fmt,
}

null_ls.config {
    sources = sources,
}

require("lspconfig")["null-ls"].setup {
    on_attach = require("lsp.utils").on_attach,
}
