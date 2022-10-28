-- import null-ls plugin safely
local setup, null_ls = pcall(require, "null-ls")
if not setup then
  return
end

local b = null_ls.builtins

local sources = {
  -- formatting
  b.formatting.stylua,
  b.formatting.gofmt,
  --   conditional enabling
  --   b.formatting.stylua.with({
  --     condition = function(utils)
  --         return utils.root_has_file("stylua.toml")
  --     end,
  -- }),
  -- b.formatting.terraform_fmt,
  b.formatting.goimports,
}

null_ls.setup {
  sources = sources,
  on_attach = require("lsp.utils").on_attach,
}
