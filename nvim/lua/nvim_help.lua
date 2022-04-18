-- Open help vertically and press q to exit
vim.api.nvim_create_augroup("Help", { clear = true })
vim.api.nvim_create_autocmd("BufEnter", {
    callback = function()
        if vim.bo.buftype == "help" then
            local bufnr = vim.api.nvim_get_current_buf()
            vim.cmd "wincmd L"
            vim.keymap.set("n", "q", ":q<CR>", { silent = true, buffer = bufnr })
        end
    end,
    group = "Help",
    desc = "Format document on save with LSP",
    pattern = "*.txt",
})
