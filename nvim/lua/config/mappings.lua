local attach_opts = { silent = true }
local utils = require "utils"

local function url_repo()
    local cursorword = vim.fn.expand "<cfile>"
    if string.find(cursorword, "^[a-zA-Z0-9-_.]*/[a-zA-Z0-9-_.]*$") then
        cursorword = "https://github.com/" .. cursorword
    end
    return cursorword or ""
end

local keyword_program = function(word)
    local original_iskeyword = vim.bo.iskeyword

    vim.bo.iskeyword = vim.bo.iskeyword .. ",."
    word = word or vim.fn.expand "<cword>"

    vim.bo.iskeyword = original_iskeyword

    if string.find(word, "vim.api") then
        local _, finish = string.find(word, "vim.api.")
        local api_function = string.sub(word, finish + 1)

        vim.cmd(string.format("help %s", api_function))
        return
    elseif string.find(word, "vim.fn") then
        local _, finish = string.find(word, "vim.fn.")
        local api_function = string.sub(word, finish + 1) .. "()"

        vim.cmd(string.format("help %s", api_function))
        return
    else
        local ok = pcall(vim.cmd, string.format("help %s", word))

        if not ok then
            local split_word = vim.split(word, ".", true)
            ok = pcall(vim.cmd, string.format("help %s", split_word[#split_word]))
        end

        if not ok then
            vim.lsp.buf.hover()
        end
    end
end

local open_command = "xdg-open"
if vim.fn.has "mac" == 1 then
    open_command = "open"
end
vim.keymap.set("n", "gx", function()
    vim.fn.jobstart({ open_command, url_repo() }, { detach = true })
end, attach_opts)

--- Commands to troubleshoot LSP{{{
--- :lua print(vim.inspect(vim.lsp.buf_get_clients()))
--- :lua vim.cmd('e'..vim.lsp.get_log_path())
--- :LspInfo
--- Set log level to debug:
--- vim.lsp.set_log_level("debug")}}}

local function Show_documentation()
    if vim.fn.index({ "vim", "help" }, vim.bo.filetype) >= 0 then
        vim.cmd("h " .. vim.fn.expand "<cword>")
    elseif vim.fn.index({ "lua" }, vim.bo.filetype) >= 0 then
        keyword_program()
    else
        require("lspsaga.hover").render_hover_doc()
    end
end

vim.keymap.set("n", "K", function()
    Show_documentation()
end, attach_opts)

vim.keymap.set({ "n", "t" }, "<Space>t9", function()
    _K9S_TOGGLE()
end, attach_opts)

vim.keymap.set({ "n", "t" }, "<M-\\>", "<cmd>ToggleTerm direction=float<CR>", attach_opts)

--- luasnip keymappings
vim.keymap.set({ "i", "s" }, "<c-x>", function()
    require("luasnip").expand_or_jump()
end, attach_opts)
vim.keymap.set({ "i", "s" }, "<c-n>", function()
    require("luasnip").change_choice(1)
end, attach_opts)
vim.keymap.set({ "i", "s" }, "<c-p>", function()
    require("luasnip").change_choice(-1)
end, attach_opts)
vim.keymap.set({ "i", "s" }, "<c-j>", function()
    require("luasnip").jump(1)
end, attach_opts)
vim.keymap.set({ "i", "s" }, "<c-k>", function()
    require("luasnip").jump(-1)
end, attach_opts)

vim.keymap.set("n", "<F3>", function()
    require("lf").start {
        -- Pass options (if any) that you would like
        -- dir = ".", -- directory where `lf` starts ('gwd' is git-working-directory)
        direction = "float", -- window type: float horizontal vertical
        border = "double", -- border kind: single double shadow curved
        height = 52, -- height of the *floating* window
        width = 150, -- width of the *floating* window
        mappings = false, -- whether terminal buffer mapping is enabled
    }
end, { noremap = true, silent = true })

vim.keymap.set("n", "<Space>fn", function()
    local filename = vim.fn.expand "%:p"
    utils.info("Yanking current filename: " .. filename, "INFO")
    vim.fn.setreg("+", filename)
end, attach_opts)

local function yank_nodepath()
    local ft = vim.bo.ft
    if ft == "yaml" or ft == "helm" then
        return require("utils.yaml").statusline()
    else
        return "Not in YAML or JSON!"
    end
end

vim.keymap.set("n", "<Space>fp", function()
    local path = yank_nodepath()
    print(path)
    utils.info("Yanking current " .. vim.bo.ft .. "path: " .. path, "INFO")
    vim.fn.setreg("+", path)
end, attach_opts)

-- Use Visual mode for Multiline, selection is kind flacky
vim.keymap.set({ "n", "v" }, "[6", function()
    require("base64.command").encode()
end, attach_opts)

vim.keymap.set({ "n", "v" }, "]6", function()
    require("base64.command").decode()
end, attach_opts)
