local M = {}

local keymap = vim.api.nvim_set_keymap

M.setup = function()
  require('compe').setup({
      enabled = true,
      debug = false,
      min_length = 2,
      auto_preselect = false,
      throttle_time = 100,
      source_timeout = 200,
      incomplete_delay = 400,
      allow_prefix_unmatch = false,

      source = {
        buffer = true,
        nvim_lsp = true,
        nvim_treesitter = true,
        path = true,
        spell = true,
        tags = true,
        ultisnips = false,
        vsnip = false,
      }
  })
end

function Check_backspace()
    local col = vim.fn.col('.') - 1
    if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
        return true
    else
        return false
    end
end

keymap('i', '<Tab>',
    'pumvisible() ? "<C-n>" : v:lua.Check_backspace() ? "<Tab>" : compe#confirm("<CR>")',
    {silent = true, noremap = true, expr = true})

keymap('i', '<S-Tab>', 'pumvisible() ? "<C-p>" : "<S-Tab>"',
    {noremap = true, expr = true})

keymap('i', '<C-space>', '<C-r>=compe#complete()<CR>',
    {noremap = false, silent = true})

return M
