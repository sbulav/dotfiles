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
    desc = "Show help with vsplit window",
    pattern = "*.txt",
})

return function(filename)
    local to_search

    if not filename then
        local line = vim.fn.getline "."

        -- require('.*')
        local result = string.match(line, [[require%('(.*)'%)]])

        -- require'.*'
        if result == nil then
            result = string.match(line [[require'(.*)']])
        end

        -- require(".*")
        if result == nil then
            result = string.match(line, [[require%("(.*)"%))]])
        end

        -- require".*"
        if result == nil then
            result = string.match(line [[require(".*"%)]])
        end

        to_search = result
    else
        to_search = filename
    end

    local found_file = package.searchpath(to_search, package.path)

    if not found_file then
        found_file = package.searchpath(to_search, package.cpath)
    end

    -- TODO: What happens when it's nil?
    return found_file or ""
end
