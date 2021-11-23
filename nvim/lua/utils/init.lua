local M = {}
local api = vim.api

_G.dump = function(...)
    local objects = vim.tbl_map(vim.inspect, { ... })
    print(unpack(objects))
end

_G.reload = function(modname)
    package.loaded[modname] = nil
    return require(modname)
end

_G.prequire = function(plugin, verbose)
    local present, plug = pcall(require, plugin)
    if present then
        return plug
    end
    local errmsg = string.format("Could not load %s", plugin)
    if verbose then
        errmsg = string.format("%s\nError:%s", plug)
    end
    print(errmsg)
end

-- Taken from https://github.com/norcalli/nvim_utils/blob/master/lua/nvim_utils.lua#L554-L567
function M.nvim_create_augroups(definitions)
    for group_name, definition in pairs(definitions) do
        vim.cmd("augroup " .. group_name)
        vim.cmd "autocmd!"
        for _, def in ipairs(definition) do
            local command = table.concat(vim.tbl_flatten { "autocmd", def }, " ")
            vim.cmd(command)
        end
        vim.cmd "augroup END"
    end
end

M.map = setmetatable({}, {
    __index = function(_, mode)
        return setmetatable({}, {
            __newindex = function(_, lhs, tbl)
                if tbl == nil then
                    api.nvim_del_keymap(mode, lhs)
                    return
                end
                local rhs = table.remove(tbl, 1)
                local opts = {}
                for _, v in ipairs(tbl) do
                    opts[v] = true
                end
                api.nvim_set_keymap(mode, lhs, rhs, opts)
            end,
        })
    end,
})
return M
