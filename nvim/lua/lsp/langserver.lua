local lspconfig = require'lspconfig'

local function custom_on_init()
    print('Language Server Protocol started!')
end

lspconfig.pyright.setup{
  on_init = custom_on_init;
}

lspconfig.terraformls.setup{
  on_init = custom_on_init;
}

-- NOTE: This replaces the calls where you would have before done `require('nvim_lsp').sumneko_lua.setup()`
require('nlua.lsp.nvim').setup(require('lspconfig'), {
  on_init = custom_on_init,

  -- Include globals you want to tell the LSP are real :)
  globals = {
    -- Colorbuddy
    "Color", "c", "Group", "g", "s",
  }
})

lspconfig.yamlls.setup{
  on_init = custom_on_init,
  settings = {
    filetypes = {"yaml", "helm"},
    yaml = {
      schemas = {
        kubernetes = '/*.yaml',
        ['https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json'] = 'docker-compose*.yml',
        ['https://json.schemastore.org/github-workflow'] = '.github/workflows/*';
      }
    }
  }
}

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
