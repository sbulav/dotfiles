require("utils.marks").setup()

local M = {}

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
    M.error(errmsg, "Prequire failed")
end

function M.trim_trailing_whitespaces()
    if not vim.o.binary and vim.o.filetype ~= "diff" and not vim.o.readonly then
        local current_view = vim.fn.winsaveview()
        vim.cmd [[keeppatterns %s/\s\+$//e]] --remove trailing whitespace
        vim.cmd [[keeppatterns %s/\($\n\s*\)\+\%$//e]] --remove empty lines at end of file
        vim.fn.winrestview(current_view)
    end
end

function M.cheatSheetCommand(detect_language)
    detect_language = (detect_language == nil and true) or detect_language
    local input = "[cht.sh] "
    local language = ""
    local wordList = {}
    local begin = 2
    if detect_language and vim.bo.filetype then
        language = vim.bo.filetype
        input = vim.fn.input(input .. language .. "/")
        begin = 1
    else
        -- The first word is the language of choice
        input = vim.fn.input(input)
        language = vim.split(input, " ")[1]
    end
    wordList = vim.split(input, " ")
    if input ~= nil then
        local searchPhrase = wordList[begin]
        if begin ~= #wordList then
            for i = begin + 1, #wordList do
                searchPhrase = searchPhrase .. "+" .. wordList[i]
            end
        end

        local command = language .. "/" .. searchPhrase

        M.info("cht.sh/" .. command, "Cheat Sheet Query")
        return ("!curl -s cht.sh/" .. command)
    else
        -- print "Error. No input or Wrong input"
        M.warn("Error. No input or Wrong input", "Cht.sh curl failed")
        return "messages"
    end
end

function M.log(msg, hl, name)
    name = name or "Neovim"
    hl = hl or "Todo"
    vim.api.nvim_echo({ { name .. ": ", hl }, { msg } }, true, {})
end

function M.warn(msg, name)
    vim.notify(msg, vim.log.levels.WARN, { title = name })
end

function M.error(msg, name)
    vim.notify(msg, vim.log.levels.ERROR, { title = name })
end

function M.info(msg, name)
    vim.notify(msg, vim.log.levels.INFO, { title = name })
end
return M
