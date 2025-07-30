local M = {}

local Defaults = {
    group = "marks",
    priority = 7,
}

local config = {}
local next_id = 1

-- Helpers
local function is_upper(char)
    return char and char:match "%u" ~= nil
end

local function is_lower(char)
    return char and char:match "%l" ~= nil
end

local function path_exists(path)
    return vim.loop.fs_stat(path) and true or false
end

local function define_sign(name)
    -- Only define sign if not already defined
    if not pcall(vim.fn.sign_getdefined, name) or #vim.fn.sign_getdefined(name) == 0 then
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
end

local function set_sign(id, group, name, lnum, priority)
    vim.fn.sign_place(id, group, name, vim.api.nvim_buf_get_name(0), { lnum = lnum, priority = priority })
end

local function remove_signs(group)
    vim.fn.sign_unplace(group)
end

local function add_global_marks()
    local global_marks = vim.fn.getmarklist()
    for _, v in ipairs(global_marks) do
        if vim.fn.expand(v.file) == vim.api.nvim_buf_get_name(0) then
            local name = v.mark:sub(-1)
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
    local local_marks = vim.fn.getmarklist(vim.api.nvim_buf_get_name(0))
    for _, v in ipairs(local_marks) do
        local name = v.mark:sub(-1)
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
    }
    local marks_table = {}
    -- Define which marks to include in quickfix (example: N/E/I/O)
    local valid_marks = { N = true, E = true, I = true, O = true }
    for _, v in ipairs(global_marks.items) do
        local mark_name = v.mark:sub(-1)
        local _, lnum, col, _ = unpack(v.pos)
        local row = {
            text = mark_name,
            filename = vim.fs.normalize(v.file),
            lnum = lnum,
            col = col,
        }
        if valid_marks[mark_name] and path_exists(row.filename) then
            table.insert(marks_table, row)
        end
    end
    vim.fn.setqflist({}, " ", { title = "Bookmarks", id = "$", items = marks_table })
    -- Optional: Open your quickfix window (replace with your preferred method)
    pcall(function()
        require("quicker").toggle()
    end)
end

function M.setup(user_config)
    config = vim.tbl_deep_extend("force", {}, Defaults, user_config or {})
    vim.api.nvim_create_augroup("marks_hl", { clear = true })
    vim.api.nvim_create_autocmd("BufEnter", {
        callback = function()
            M.refresh()
        end,
        group = "marks_hl",
        desc = "Document Highlight",
    })
end

function M.refresh()
    next_id = 1 -- Reset sign ID counter for each refresh
    remove_signs(config.group)
    add_global_marks()
    add_local_marks()
end

return M
