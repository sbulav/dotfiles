local attach_opts = { silent = true }
local utils = require "utils"

local function toggle_terminal(opts)
    Snacks.terminal.toggle(nil, opts)
end

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

vim.keymap.set({ "n", "t" }, "<C-\\>", function()
    toggle_terminal {
        count = 1,
        win = {
            position = "right",
            width = 0.4,
        },
    }
end, attach_opts)

vim.keymap.set({ "n", "t" }, "<M-\\>", function()
    toggle_terminal {
        count = 2,
        win = {
            position = "float",
            border = "rounded",
            width = 0.9,
            height = 0.9,
        },
    }
end, attach_opts)

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

vim.keymap.set("n", "<Space>yn", function()
    local filename = vim.fn.expand "%:p"
    utils.info("Yanking current filename: " .. filename, "INFO")
    vim.fn.setreg("+", filename)
end, attach_opts)

-- Resolve the PR URL for the current branch, dispatching on the remote host:
-- GitHub remotes use `gh`, everything else is treated as Forgejo/Gitea via `tea`.
local function current_pr_url()
    local function trim(s)
        return (s:gsub("%s+$", ""))
    end

    local remote = trim(vim.fn.system "git remote get-url origin")
    if vim.v.shell_error ~= 0 or remote == "" then
        return nil, "Not a git repo or no 'origin' remote"
    end

    if remote:match "github%.com" then
        local url = trim(vim.fn.system "gh pr view --json url --jq .url")
        if vim.v.shell_error ~= 0 or url == "" then
            return nil, "No GitHub PR for the current branch"
        end
        return url
    end

    -- Forgejo/Gitea: tea has no "current branch" shortcut, so match the open PR
    -- whose head branch equals the current branch.
    local branch = trim(vim.fn.system "git branch --show-current")
    if branch == "" then
        return nil, "Detached HEAD: no current branch"
    end

    local out = vim.fn.system "tea pr ls --output json --fields head,url --state all --limit 100"
    if vim.v.shell_error ~= 0 then
        return nil, "tea pr ls failed: " .. trim(out)
    end

    local ok, prs = pcall(vim.json.decode, out)
    if ok and type(prs) == "table" then
        for _, pr in ipairs(prs) do
            if pr.head == branch then
                return pr.url
            end
        end
    end

    return nil, "No Forgejo PR for branch '" .. branch .. "'"
end

vim.keymap.set("n", "<Space>yp", function()
    local url, err = current_pr_url()
    if not url then
        utils.error(err, "Yank PR")
        return
    end
    vim.fn.setreg("+", url)
    utils.info("Yanked PR: " .. url, "Yank PR")
end, attach_opts)

vim.keymap.set("n", "<Space>yb", function()
    local branch = vim.fn.system "git branch --show-current"
    print(branch)
    utils.info("Yanking current branch: " .. branch, "INFO")
    vim.fn.setreg("+", branch)
end, attach_opts)

-- Use Visual mode for Multiline, selection is kind flacky
vim.keymap.set({ "n", "v" }, "[6", function()
    require("base64.command").encode()
end, attach_opts)

vim.keymap.set({ "n", "v" }, "]6", function()
    require("base64.command").decode()
end, attach_opts)

-- Paste before/after linewise
vim.keymap.set({ "n", "x" }, "[p", '<Cmd>exe "put! " . v:register<CR>', { desc = "Paste Above" })
vim.keymap.set({ "n", "x" }, "]p", '<Cmd>exe "put "  . v:register<CR>', { desc = "Paste Below" })

vim.keymap.set("n", "<leader>mq", function()
    require("utils.marks").marks_to_quickfix_list()
end, { desc = "Tracked Marks Quickfix" })

vim.keymap.set("n", "]m", function()
    require("utils.marks").next()
end, { desc = "Next Tracked Mark" })

vim.keymap.set("n", "[m", function()
    require("utils.marks").prev()
end, { desc = "Previous Tracked Mark" })
