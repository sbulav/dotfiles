local M = {}

local Defaults = {
    group = "tracked_marks",
    priority = 7,
    tracked = { "N", "E", "I", "O" },
    refresh_events = { "BufEnter", "CursorHold" },
    quickfix_title = "Tracked Marks",
    picker_title = "Tracked Marks",
}

local config = vim.deepcopy(Defaults)
local sign_names = {}

local function path_exists(path)
    return path ~= "" and vim.uv.fs_stat(path) ~= nil
end

local function normalize(path)
    if not path or path == "" then
        return ""
    end

    return vim.fs.normalize(path)
end

local function tracked_order(mark)
    return config._tracked_order[mark] or math.huge
end

local function is_tracked(mark)
    return config._tracked_lookup[mark] == true
end

local function current_buf_path(bufnr)
    return normalize(vim.api.nvim_buf_get_name(bufnr))
end

local function has_tracked_lowercase_marks()
    for _, mark in ipairs(config.tracked) do
        if mark:match "%l" then
            return true
        end
    end

    return false
end

local function define_sign(mark)
    local sign_name = sign_names[mark]
    if sign_name then
        return sign_name
    end

    sign_name = "TrackedMarkSign_" .. mark
    if #vim.fn.sign_getdefined(sign_name) == 0 then
        vim.fn.sign_define(sign_name, {
            text = mark,
            texthl = "Identifier",
            numhl = "CursorLineNr",
        })
    end

    sign_names[mark] = sign_name
    return sign_name
end

local function sort_marks(marks)
    table.sort(marks, function(a, b)
        local order_a = tracked_order(a.mark)
        local order_b = tracked_order(b.mark)

        if order_a ~= order_b then
            return order_a < order_b
        end

        if a.file ~= b.file then
            return a.file < b.file
        end

        if a.lnum ~= b.lnum then
            return a.lnum < b.lnum
        end

        return a.col < b.col
    end)

    return marks
end

local function trim_preview(line)
    return vim.trim((line or ""):gsub("%s+", " "))
end

local function read_preview_line(file, lnum)
    if not path_exists(file) or lnum < 1 then
        return ""
    end

    local bufnr = vim.fn.bufnr(file, false)
    if bufnr ~= -1 and vim.api.nvim_buf_is_loaded(bufnr) then
        return trim_preview(vim.api.nvim_buf_get_lines(bufnr, lnum - 1, lnum, false)[1])
    end

    local ok, lines = pcall(vim.fn.readfile, file, "", lnum)
    if not ok then
        return ""
    end

    return trim_preview(lines[lnum] or lines[#lines])
end

local function build_mark_item(mark, file, lnum, col)
    return {
        mark = mark,
        file = normalize(file),
        lnum = lnum,
        col = math.max(col, 1),
    }
end

local function get_global_marks()
    local marks = {}

    for _, entry in ipairs(vim.fn.getmarklist()) do
        local mark = entry.mark:sub(-1)
        local file = normalize(entry.file)
        local _, lnum, col = unpack(entry.pos)

        if is_tracked(mark) and path_exists(file) and lnum > 0 then
            marks[#marks + 1] = build_mark_item(mark, file, lnum, col)
        end
    end

    return marks
end

local function get_local_marks(bufnr)
    local marks = {}

    if not has_tracked_lowercase_marks() then
        return marks
    end

    local file = current_buf_path(bufnr)
    if file == "" then
        return marks
    end

    for _, entry in ipairs(vim.fn.getmarklist(file)) do
        local mark = entry.mark:sub(-1)
        local _, lnum, col = unpack(entry.pos)

        if is_tracked(mark) and lnum > 0 then
            marks[#marks + 1] = build_mark_item(mark, file, lnum, col)
        end
    end

    return marks
end

local function get_tracked_marks(bufnr)
    local marks = {}

    if bufnr then
        local target = current_buf_path(bufnr)

        for _, mark in ipairs(get_global_marks()) do
            if mark.file == target then
                marks[#marks + 1] = mark
            end
        end

        for _, mark in ipairs(get_local_marks(bufnr)) do
            marks[#marks + 1] = mark
        end
    else
        marks = get_global_marks()
        local current = vim.api.nvim_get_current_buf()
        for _, mark in ipairs(get_local_marks(current)) do
            marks[#marks + 1] = mark
        end
    end

    for _, mark in ipairs(marks) do
        mark.preview = read_preview_line(mark.file, mark.lnum)
        mark.display_file = vim.fn.fnamemodify(mark.file, ":.")
    end

    return sort_marks(marks)
end

local function quickfix_items()
    local items = {}

    for _, mark in ipairs(get_tracked_marks()) do
        items[#items + 1] = {
            filename = mark.file,
            lnum = mark.lnum,
            col = mark.col,
            text = string.format("[%s] %s", mark.mark, mark.preview),
        }
    end

    return items
end

local function open_quickfix()
    local ok = pcall(function()
        require("quicker").toggle()
    end)

    if not ok then
        vim.cmd "copen"
    end
end

local function jump_to_mark(mark)
    if not is_tracked(mark) then
        vim.notify(string.format("Mark [%s] is not tracked.", mark), vim.log.levels.WARN, { title = "Tracked Marks" })
        return false
    end

    local ok, err = pcall(vim.cmd, "normal! `" .. mark)
    if not ok then
        vim.notify(err, vim.log.levels.WARN, { title = "Tracked Marks" })
        return false
    end

    M.refresh(vim.api.nvim_get_current_buf())
    return true
end

local function tracked_mark_names()
    local names = {}

    for _, mark in ipairs(config.tracked) do
        names[#names + 1] = mark
    end

    table.sort(names)
    return names
end

local function select_mark_index(step)
    local marks = get_tracked_marks()
    if #marks == 0 then
        vim.notify("No tracked marks found.", vim.log.levels.INFO, { title = "Tracked Marks" })
        return nil
    end

    local current_file = current_buf_path(vim.api.nvim_get_current_buf())
    local cursor = vim.api.nvim_win_get_cursor(0)

    for index, mark in ipairs(marks) do
        if mark.file == current_file and mark.lnum == cursor[1] then
            return ((index - 1 + step) % #marks) + 1, marks
        end
    end

    if step > 0 then
        return 1, marks
    end

    return #marks, marks
end

function M.refresh(bufnr)
    bufnr = bufnr or vim.api.nvim_get_current_buf()
    if not vim.api.nvim_buf_is_valid(bufnr) then
        return
    end

    vim.fn.sign_unplace(config.group, { buffer = bufnr })

    local marks = get_tracked_marks(bufnr)
    for index, mark in ipairs(marks) do
        vim.fn.sign_place(index, config.group, define_sign(mark.mark), bufnr, {
            lnum = mark.lnum,
            priority = config.priority,
        })
    end
end

function M.refresh_all()
    for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
        if vim.api.nvim_buf_is_loaded(bufnr) then
            M.refresh(bufnr)
        end
    end
end

function M.jump(mark)
    return jump_to_mark(mark)
end

function M.next()
    local index, marks = select_mark_index(1)
    if not index then
        return
    end

    jump_to_mark(marks[index].mark)
end

function M.prev()
    local index, marks = select_mark_index(-1)
    if not index then
        return
    end

    jump_to_mark(marks[index].mark)
end

function M.delete(mark)
    local ok = pcall(vim.api.nvim_del_mark, mark)
    if not ok then
        local deleted = pcall(vim.api.nvim_buf_del_mark, 0, mark)
        if not deleted then
            vim.notify(string.format("Could not delete mark [%s].", mark), vim.log.levels.WARN, { title = "Tracked Marks" })
            return false
        end
    end

    M.refresh_all()
    return true
end

function M.marks_to_quickfix_list()
    local items = quickfix_items()
    vim.fn.setqflist({}, " ", { title = config.quickfix_title, id = "$", items = items })

    if #items == 0 then
        vim.notify("No tracked marks found.", vim.log.levels.INFO, { title = "Tracked Marks" })
        return items
    end

    open_quickfix()
    return items
end

function M.picker()
    local items = {}

    for index, mark in ipairs(get_tracked_marks()) do
        items[#items + 1] = {
            idx = index,
            mark = mark.mark,
            file = mark.file,
            pos = { mark.lnum, math.max(mark.col - 1, 0) },
            text = string.format("[%s] %s:%d %s", mark.mark, mark.display_file, mark.lnum, mark.preview),
        }
    end

    if #items == 0 then
        vim.notify("No tracked marks found.", vim.log.levels.INFO, { title = "Tracked Marks" })
        return
    end

    M.refresh(vim.api.nvim_get_current_buf())

    local ok, snacks = pcall(function()
        return Snacks
    end)
    if not ok or not snacks or not snacks.picker then
        M.marks_to_quickfix_list()
        return
    end

    snacks.picker.pick({
        title = config.picker_title,
        items = items,
        format = "text",
        preview = "preview",
        layout = { preset = "vertical" },
        matcher = { sort_empty = false },
        sort = { fields = { "score:desc", "idx" } },
        prompt = "Marks> ",
        confirm = function(picker, item)
            picker:close()
            if item then
                jump_to_mark(item.mark)
            end
        end,
    })
end

function M.setup(user_config)
    config = vim.tbl_deep_extend("force", {}, Defaults, user_config or {})
    config._tracked_lookup = {}
    config._tracked_order = {}

    for index, mark in ipairs(config.tracked) do
        config._tracked_lookup[mark] = true
        config._tracked_order[mark] = index
    end

    local group = vim.api.nvim_create_augroup("tracked_marks", { clear = true })
    vim.api.nvim_create_autocmd(config.refresh_events, {
        group = group,
        callback = function(args)
            M.refresh(args.buf)
        end,
        desc = "Refresh tracked mark signs",
    })

    vim.api.nvim_create_user_command("TrackedMarks", function()
        M.picker()
    end, { desc = "Open tracked marks picker" })

    vim.api.nvim_create_user_command("TrackedMarksQF", function()
        M.marks_to_quickfix_list()
    end, { desc = "Populate quickfix with tracked marks" })

    vim.api.nvim_create_user_command("TrackedMarksRefresh", function()
        M.refresh_all()
    end, { desc = "Refresh tracked mark signs" })

    vim.api.nvim_create_user_command("TrackedMarkJump", function(opts)
        M.jump(opts.args)
    end, {
        nargs = 1,
        complete = tracked_mark_names,
        desc = "Jump to a tracked mark",
    })

    vim.api.nvim_create_user_command("TrackedMarkDelete", function(opts)
        M.delete(opts.args)
    end, {
        nargs = 1,
        complete = tracked_mark_names,
        desc = "Delete a tracked mark",
    })
end

return M
