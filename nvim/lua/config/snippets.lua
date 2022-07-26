local ls = require "luasnip"
-- some shorthands...
local snip = ls.snippet
local node = ls.snippet_node
local text = ls.text_node
local insert = ls.insert_node
local func = ls.function_node
local choice = ls.choice_node
local dynamicn = ls.dynamic_node

ls.config.set_config {
    history = true,
    -- treesitter-hl has 100, use something higher (default is 200).
    ext_base_prio = 200,
    -- minimal increase in priority.
    ext_prio_increase = 1,
    enable_autosnippets = false,
    store_selection_keys = "<c-s>",
}

local date = function()
    return { os.date "%Y-%m-%d" }
end

local filename = function()
    return { vim.fn.expand "%:p" }
end

-- Make sure to not pass an invalid command, as io.popen() may write over nvim-text.
local function bash(_, _, command)
    local file = io.popen(command, "r")
    local res = {}
    for line in file:lines() do
        table.insert(res, line)
    end
    return res
end

ls.add_snippets(nil, {
    all = {
        snip({
            trig = "date",
            namr = "Date",
            dscr = "Date in the form of YYYY-MM-DD",
        }, {
            func(date, {}),
        }),
        snip({
            trig = "pwd",
            namr = "PWD",
            dscr = "Path to current working directory",
        }, {
            func(bash, {}, { user_args = { "pwd" } }),
        }),
        snip({
            trig = "filename",
            namr = "Filename",
            dscr = "Absolute path to file",
        }, {
            func(filename, {}),
        }),
        snip({
            trig = "signature",
            namr = "Signature",
            dscr = "Name and Surname",
        }, {
            text "Sergei Bulavintsev",
            insert(0),
        }),
    },
    sh = {
        snip("shebang", {
            text { "#!/bin/sh", "" },
            insert(0),
        }),
    },
    python = {
        snip("shebang", {
            text { "#!/usr/bin/env python", "" },
            insert(0),
        }),
    },
    lua = {
        snip("shebang", {
            text { "#!/usr/bin/lua", "", "" },
            insert(0),
        }),
        snip("req", {
            text "require('",
            insert(1, "Module-name"),
            text "')",
            insert(0),
        }),
        snip("func", {
            text "function(",
            insert(1, "Arguments"),
            text { ")", "\t" },
            insert(2),
            text { "", "end", "" },
            insert(0),
        }),
        snip("forp", {
            text "for ",
            insert(1, "k"),
            text ", ",
            insert(2, "v"),
            text " in pairs(",
            insert(3, "table"),
            text { ") do", "\t" },
            insert(4),
            text { "", "end", "" },
            insert(0),
        }),
        snip("fori", {
            text "for ",
            insert(1, "k"),
            text ", ",
            insert(2, "v"),
            text " in ipairs(",
            insert(3, "table"),
            text { ") do", "\t" },
            insert(4),
            text { "", "end", "" },
            insert(0),
        }),
        snip("if", {
            text "if ",
            insert(1),
            text { " then", "\t" },
            insert(2),
            text { "", "end", "" },
            insert(0),
        }),
        snip("M", {
            text { "local M = {}", "", "" },
            insert(0),
            text { "", "", "return M" },
        }),
    },
    markdown = {
        -- Select link, press C-s, enter link to receive snippet
        snip({
            trig = "link",
            namr = "markdown_link",
            dscr = "Create markdown link [txt](url)",
        }, {
            text "[",
            insert(1),
            text "](",
            func(function(_, snip)
                return snip.env.TM_SELECTED_TEXT[1] or {}
            end, {}),
            text ")",
            insert(0),
        }),
        snip({
            trig = "codewrap",
            namr = "markdown_code_wrap",
            dscr = "Create markdown code block from existing text",
        }, {
            text "``` ",
            insert(1, "Language"),
            text { "", "" },
            func(function(_, snip)
                local tmp = {}
                tmp = snip.env.TM_SELECTED_TEXT
                tmp[0] = nil
                return tmp or {}
            end, {}),
            text { "", "```", "" },
            insert(0),
        }),
        snip({
            trig = "codeempty",
            namr = "markdown_code_empty",
            dscr = "Create empty markdown code block",
        }, {
            text "``` ",
            insert(1, "Language"),
            text { "", "" },
            insert(2, "Content"),
            text { "", "```", "" },
            insert(0),
        }),
        snip({
            trig = "meta",
            namr = "Metadata",
            dscr = "Yaml metadata format for markdown",
        }, {
            text { "---", "title: " },
            insert(1, "note_title"),
            text { "", "author: " },
            insert(2, "author"),
            text { "", "date: " },
            func(date, {}),
            text { "", "cathegories: [" },
            insert(3, ""),
            text { "]", "lastmod: " },
            func(date, {}),
            text { "", "tags: [" },
            insert(4),
            text { "]", "comments: true", "---", "" },
            insert(0),
        }),
    },
    go = {
        snip("test", {
            text "func ",
            insert(1, "Name"),
            text "(t *testing.T)",
            text { " {", "" },
            text "\t",
            insert(0),
            text { "", "}" },
        }),
        snip("typei", {
            text "type ",
            insert(1, "Name"),
            text { " interface {", "" },
            text "\t",
            insert(0),
            text { "", "}" },
        }),
        snip("types", {
            text "type ",
            insert(1, "Name"),
            text { " struct {", "" },
            text "\t",
            insert(0),
            text { "", "}" },
        }),
        snip("func", {
            text "func ",
            insert(1, "Name"),
            text "(",
            insert(2),
            text ")",
            insert(3),
            text { " {", "" },
            text "\t",
            insert(0),
            text { "", "}" },
        }),
        snip("if", {
            text "if ",
            insert(1, "true"),
            text { " {", "" },
            text "\t",
            insert(0),
            text { "", "}" },
        }),

        snip("fori", {
            text "for ",
            insert(1, "i := 0"),
            text ";",
            insert(2, "i < 10"),
            text ";",
            insert(3, "i++"),
            text { " {", "" },
            text "\t",
            insert(0),
            text { "", "}" },
        }),
        snip("forr", {
            text "for ",
            insert(1, "k, v"),
            text " := range ",
            insert(2, "expr"),
            text { " {", "" },
            text "\t",
            insert(0),
            text { "", "}" },
        }),
    },
})
