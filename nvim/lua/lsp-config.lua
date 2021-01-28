local lspconfig = require'lspconfig'

local function custom_on_init()
    print('Language Server Protocol started!')
end

-- Enable/disable specific diagnostics features
-- :h vim.lsp.diagnostic.on_publish_diagnostics()
-- vim.lsp.handlers["textDocument/publishDiagnostics"] =
--   vim.lsp.with(
--   vim.lsp.diagnostic.on_publish_diagnostics,
--   {
--     underline = true,
--     virtual_text = true,
--     signs = true,
--     update_in_insert = false
--   }
-- )

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

lspconfig.pyright.setup{
  on_attach = custom_on_init;
}

lspconfig.terraformls.setup{
  on_attach = custom_on_init;
}

-- Workaround to not trigger yaml on helm files
-- if vim.api.nvim_buf_get_option(vim.api.nvim_get_current_buf(), 'filetype') ~= 'yaml'
--   and not string.find(vim.fn.expand('%:p'), "template")
--   and not string.find(vim.fn.expand('%:p'), "Chart.yaml")
--   and not string.find(vim.fn.expand('%:p'), "values") then
-- -- print("Setting up yamlls")
-- -- print(vim.fn.expand('%:p'))
-- lspconfig.yamlls.setup{
--   on_attach = custom_on_init;
--   settings = {
--     filetypes = {"yaml"},
--     yaml = {
--       schemas = {
--         -- kubernetes = '/*.yaml';
--         ['https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json'] = 'docker-compose*.yml',
--         ['https://json.schemastore.org/github-workflow'] = '.github/workflows/*';
--       }
--     }
--   }
-- }
-- end

-- local system_name
-- if vim.fn.has("mac") == 1 then
--   system_name = "macOS"
-- elseif vim.fn.has("unix") == 1 then
--   system_name = "Linux"
-- elseif vim.fn.has('win32') == 1 then
--   system_name = "Windows"
-- else
--   print("Unsupported system for sumneko")
-- end

-- -- set the path to the sumneko installation; if you previously installed via the now deprecated :LspInstall, use
-- local sumneko_root_path = vim.fn.stdpath('cache')..'/lspconfig/sumneko_lua/lua-language-server'
-- local sumneko_binary = sumneko_root_path.."/bin/"..system_name.."/lua-language-server"

-- lspconfig.sumneko_lua.setup {
--   cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"};
--   settings = {
--     Lua = {
--       runtime = {
--         -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
--         version = 'LuaJIT',
--         -- Setup your lua path
--         path = vim.split(package.path, ';'),
--       },
--       diagnostics = {
--         -- Get the language server to recognize the `vim` global
--         globals = {'vim'},
--       },
--       workspace = {
--         -- Make the server aware of Neovim runtime files
--         library = {
--           [vim.fn.expand('$VIMRUNTIME/lua')] = true,
--           [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
--         },
--       },
--     },
--   },
-- }

-- To get builtin LSP running, do something like:
-- NOTE: This replaces the calls where you would have before done `require('nvim_lsp').sumneko_lua.setup()`
require('nlua.lsp.nvim').setup(require('lspconfig'), {
  on_attach = custom_on_init,

  -- Include globals you want to tell the LSP are real :)
  globals = {
    -- Colorbuddy
    "Color", "c", "Group", "g", "s",
  }
})
