function _G.dump(...)
    local objects = vim.tbl_map(vim.inspect, {...})
end
