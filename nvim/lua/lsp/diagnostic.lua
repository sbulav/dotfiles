
-- Enable/disable specific diagnostics features
-- :h vim.lsp.diagnostic.on_publish_diagnostics()
vim.lsp.handlers["textDocument/publishDiagnostics"] =
  vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
      signs = true,
      underline = true,
      update_in_insert = true,
      virtual_text = true
    }
  )

-- Customize diagnostics signs
local function set_sign(type, icon)
  local sign = string.format("LspDiagnosticsSign%s", type)
  local texthl = string.format("LspDiagnosticsDefault%s", type)
  vim.fn.sign_define(sign, {text = icon, texthl = texthl})
end

set_sign("Hint", "➤")
set_sign("Information", "ℹ")
set_sign("Warning", "⚠")
set_sign("Error", "✖")

