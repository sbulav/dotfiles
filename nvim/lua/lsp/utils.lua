local M = {}
local utils = require "utils"
local navic = require "nvim-navic"

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
function M.on_attach(client, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

    if client.supports_method "textDocument/documentSymbols" then
        navic.attach(client, bufnr)
    end

    local attach_opts = { silent = true, buffer = bufnr }

    -- lsp provider to find the cursor word definition and reference
    vim.keymap.set("n", "gh", function()
        require("lspsaga.provider").lsp_finder()
    end, attach_opts)
    -- show function signature help
    vim.keymap.set("n", "gs", vim.lsp.buf.signature_help, attach_opts)
    -- rename
    vim.keymap.set("n", "gr", function()
        require("lspsaga.rename").rename()
    end, attach_opts)
    -- preview definition
    vim.keymap.set("n", "gD", function()
        require("lspsaga.provider").preview_definition()
    end, attach_opts)
    -- go to implementation
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, attach_opts)
    -- go to definition
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, attach_opts)
    -- show line diagnostic
    vim.keymap.set("n", "ge", function()
        require("lspsaga.diagnostic").show_line_diagnostics()
    end, attach_opts)
    -- jump diagnostic
    vim.keymap.set("n", "]e", function()
        require("lspsaga.diagnostic").navigate "next"()
    end, attach_opts)
    vim.keymap.set("n", "[e", function()
        require("lspsaga.diagnostic").navigate "prev"()
    end, attach_opts)
    vim.keymap.set("n", "<leader>so", function()
        require("telescope.builtin").lsp_document_symbols()
    end, attach_opts)
    vim.keymap.set("n", "<leader>sr", function()
        require("telescope.builtin").lsp_references()
    end, attach_opts)

    vim.api.nvim_create_user_command("Format", vim.lsp.buf.format, {})

    -- Disable formatting with other LSPs because we're handling formatting via null-ls
    -- Otherwise you'll be prompted to Select a language server
    -- Update when on the 0.8 https://github.com/jose-elias-alvarez/null-ls.nvim/wiki/Avoiding-LSP-formatting-conflicts#neovim-08
    -- if client.name ~= "null-ls" then
    --     client.server_capabilities.documentFormattingProvider = false
    --     client.resolved_capabilities.document_formatting = false
    -- end

    -- Server capabilities spec:
    -- https://microsoft.github.io/language-server-protocol/specifications/lsp/3.17/specification/#serverCapabilities
    -- print(dump(client.server_capabilities))

    if client.supports_method "textDocument/documentHighlight" then
        vim.api.nvim_create_augroup("lsp_document_highlight", { clear = true })
        vim.api.nvim_clear_autocmds { buffer = bufnr, group = "lsp_document_highlight" }
        vim.api.nvim_create_autocmd("CursorHold", {
            callback = vim.lsp.buf.document_highlight,
            buffer = bufnr,
            group = "lsp_document_highlight",
            desc = "Document Highlight",
        })
        vim.api.nvim_create_autocmd("CursorMoved", {
            callback = vim.lsp.buf.clear_references,
            buffer = bufnr,
            group = "lsp_document_highlight",
            desc = "Clear All the References",
        })
    end

    if client.supports_method "textDocument/codeAction" then
        vim.keymap.set("n", "<leader>ga", function()
            require("lspsaga.codeaction").code_action()
        end, { buffer = bufnr, desc = "Code Actions" })
        vim.keymap.set("v", "<leader>ga", function()
            require("lspsaga.codeaction").range_code_action()
        end, { buffer = bufnr, desc = "Range Code Actions" })
        vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
            callback = function()
                require("nvim-lightbulb").update_lightbulb()
            end,
            buffer = bufnr,
            desc = "Update the LightBulb",
        })
    end

    if client.supports_method "textDocument/formatting" then
        vim.api.nvim_create_augroup("LspFormat", { clear = true })
        vim.api.nvim_create_autocmd("BufWritePre", {
            callback = function()
                vim.lsp.buf.format { async = true }
            end,
            group = "LspFormat",
            desc = "Format document on save with LSP",
        })
    end
end

function M.custom_on_init()
    -- print "Language Server Protocol started!"
    utils.info("Language Server Protocol started!", "LSP")
end

function M.has_formatter(ft)
    local sources = require "null-ls.sources"
    local available = sources.get_available(ft, "NULL_LS_FORMATTING")
    return #available > 0
end

return M
