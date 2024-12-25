local M = {}

-- kudos to https://github.com/p-kolacz/.dotfiles/blob/master/nvim/.config/nvim/lua/lib/marketeer.lua
local Defaults = {
    group = "marks",
    priority = 7,
}

local config = {}

local next_id = 1

local function is_upper(char)
    return (65 <= char:byte() and char:byte() <= 90)
end

local function is_lower(char)
    return (97 <= char:byte() and char:byte() <= 122)
end
local function path_exists(path)
    return vim.loop.fs_stat(path) and true or false
end
local function define_sign(name)
    if is_upper(name) then
        vim.fn.sign_define(name, {
            text = name,
            texthl = "Identifier",
            numhl = "CursorLineNr",
        })
    else
        vim.fn.sign_define(name, {
            text = name,
        })
    end
end

local function set_sign(id, group, name, lnum, priority)
    vim.fn.sign_place(id, group, name, vim.fn.bufname(), { lnum = lnum, priority = priority })
end

local function remove_signs(group)
    vim.fn.sign_unplace(group)
end

local function add_global_marks()
    local global_marks = vim.fn.getmarklist()
    for _, v in ipairs(global_marks) do
        if vim.fn.expand(v.file) == vim.api.nvim_buf_get_name(0) then
            local name = v.mark:sub(2, 3)
            local lnum = v.pos[2]
            if is_upper(name) then
                define_sign(name)
                set_sign(next_id, config.group, name, lnum, config.priority)
                next_id = next_id + 1
            end
        end
    end
end

local function add_local_marks()
    local local_marks = vim.fn.getmarklist(vim.fn.bufname())
    for _, v in ipairs(local_marks) do
        local name = v.mark:sub(2, 3)
        local lnum = v.pos[2]
        if is_lower(name) then
            define_sign(name)
            set_sign(next_id, config.group, name, lnum, config.priority)
            next_id = next_id + 1
        end
    end
end

function M.marks_to_quickfix_list()
    local global_marks = {
        items = vim.fn.getmarklist(),
        name_func = function(mark, _)
            -- get buffer name if it is opened, otherwise get file name
            return vim.api.nvim_get_mark(mark, {})[4]
        end,
    }
    local marks_table = {}
    for _, v in ipairs(global_marks.items) do
        -- strip the first single quote character
        local mark_name = string.sub(v.mark, 2, 3)
        local _, lnum, col, _ = unpack(v.pos)
        local row = {
            text = mark_name,
            filename = vim.fs.normalize(v.file),
            lnum = lnum,
            col = col,
        }
        if string.find("NEIO", mark_name) and path_exists(row.filename) then
            table.insert(marks_table, row)
        end
    end
    vim.fn.setqflist({}, " ", { title = "Bookmarks", id = "$", items = marks_table })
    require("quicker").toggle()
end

function M.setup(user_config)
    if not user_config then
        config = Defaults
    else
        for k, _ in pairs(Defaults) do
            config[k] = user_config[k] or Defaults[k]
        end
    end
    vim.api.nvim_create_augroup("marks_hl", { clear = true })
    vim.api.nvim_create_autocmd("BufEnter", {
        callback = require("utils.marks").refresh,
        group = "marks_hl",
        desc = "Document Highlight",
    })
end

function M.refresh()
    remove_signs(config.group)
    add_global_marks()
    add_local_marks()
end

return M
