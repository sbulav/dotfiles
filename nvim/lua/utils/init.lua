local M = {}
local fn = vim.fn
local api = vim.api

function _G.dump(...)
    local objects = vim.tbl_map(vim.inspect, {...})
    print(unpack(objects))
end

function _G.reload(modname)
    package.loaded[modname] = nil
    return require(modname)
end

-- Taken from https://github.com/norcalli/nvim_utils/blob/master/lua/nvim_utils.lua#L554-L567
function M.nvim_create_augroups(definitions)
    for group_name, definition in pairs(definitions) do
        vim.cmd('augroup ' .. group_name)
        vim.cmd('autocmd!')
        for _, def in ipairs(definition) do
            local command = table.concat(vim.tbl_flatten{'autocmd', def}, ' ')
            vim.cmd(command)
        end
        vim.cmd('augroup END')
    end
end

M.map = setmetatable({}, {
        __index = function(_, mode)
            return setmetatable({}, {
                    __newindex = function(_, lhs, tbl)
                        if tbl == nil then api.nvim_del_keymap(mode, lhs); return end
                        local rhs = table.remove(tbl, 1)
                        local opts = {}
                        for _, v in ipairs(tbl) do
                            opts[v] = true
                        end
                        api.nvim_set_keymap(mode, lhs, rhs, opts)
                    end
                })
        end
    })

return M
