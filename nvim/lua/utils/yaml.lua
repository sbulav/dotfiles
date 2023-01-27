local M = {}
local ts = require "nvim-treesitter"

function M.statusline()
    local ft = vim.bo.ft
    local status = ""
    if ft == "yaml" or ft == "helm" then
        status = ts.statusline {
            type_patterns = { "block_mapping_pair" },
            separator = ".",
            transform_fn = function(line)
                line = line:gsub("%s*[%[%(%{]*%s*$", ""):gsub(":.*$", "")
                if line:find "%." then
                    line = "'" .. line .. "'"
                end
                return line
            end,
        }
    else
        status = ts.statusline()
    end
    return "." .. status
end

return M
