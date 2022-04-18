local toggleterm = prequire "toggleterm"
if not toggleterm then
    return
end

toggleterm.setup {
    size = function(term)
        if term.direction == "horizontal" then
            return vim.o.lines * 0.25
        elseif term.direction == "vertical" then
            return vim.o.columns * 0.4
        end
    end,
    open_mapping = [[<c-\>]],
    hide_numbers = true,
    shade_filetypes = {},
    shade_terminals = true,
    shading_factor = 2,
    start_in_insert = true,
    insert_mappings = true,
    persist_size = true,
    direction = "vertical",
    close_on_exit = true,
    shell = vim.o.shell,
    float_opts = {
        border = "curved",
        winblend = 0,
        highlights = {
            border = "Normal",
            background = "Normal",
        },
    },
}

function _G.set_terminal_keymaps()
    local opts = { noremap = true }
    vim.api.nvim_buf_set_keymap(0, "t", "<esc>", [[<C-\><C-n>]], opts)
    vim.api.nvim_buf_set_keymap(0, "t", "<c-o>", "<esc>", opts)
    vim.api.nvim_buf_set_keymap(0, "t", "<C-h>", [[<C-\><C-n><C-W>h]], opts)
    vim.api.nvim_buf_set_keymap(0, "t", "<C-j>", [[<C-\><C-n><C-W>j]], opts)
    vim.api.nvim_buf_set_keymap(0, "t", "<C-k>", [[<C-\><C-n><C-W>k]], opts)
    vim.api.nvim_buf_set_keymap(0, "t", "<C-l>", [[<C-\><C-n><C-W>l]], opts)
end

vim.api.nvim_create_augroup("Terminal", { clear = true })
vim.api.nvim_create_autocmd("TermOpen", {
    callback = function()
        set_terminal_keymaps()
    end,
    group = "Terminal",
    desc = "Attach mappings to Terminal",
    pattern = "term://*",
})
local Terminal = require("toggleterm.terminal").Terminal

local k9s = Terminal:new { cmd = "k9s", hidden = true, direction = "float" }

function _K9S_TOGGLE()
    k9s:toggle()
end

-- fix mapping order overriding with default command
vim.api.nvim_set_keymap("n", "<c-\\>", "<cmd>ToggleTerm direction=vertical<CR>", { noremap = true })
