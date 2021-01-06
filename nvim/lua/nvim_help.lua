-- Currently, there is no interface to create user commands in Lua. It is planned, though:
-- PR: https://github.com/neovim/neovim/pull/12378

local cmd = vim.cmd
local api = vim.api

-- Open help vertically and press q to exit
function help_tab()
    if vim.bo.buftype == 'help' then
        cmd('wincmd L')
        local nr = api.nvim_get_current_buf()
        api.nvim_buf_set_keymap(nr, "", "q", ":q<CR>", { noremap = true, silent = true })
    end
end
cmd("au BufEnter *.txt lua help_tab()")
