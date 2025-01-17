local M = {}
local utils = require "utils"

---@param on_attach fun(client, buffer)
function M.on_attach(on_attach)
    vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
            local buffer = args.buf
            local client = vim.lsp.get_client_by_id(args.data.client_id)
            on_attach(client, buffer)
        end,
    })
end

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
function M.custom_on_attach(client, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_set_option_value("omnifunc", "v:lua.vim.lsp.omnifunc", { buf = bufnr })

    local attach_opts = { silent = true, buffer = bufnr }

    -- lsp provider to find the cursor word definition and reference
    vim.keymap.set("n", "gh", "<cmd>Lspsaga finder<CR>")
    -- lsp outline window with symbols
    vim.keymap.set("n", "<F7>", "<cmd>Lspsaga outline<CR>")
    -- show function signature help
    vim.keymap.set("n", "gs", vim.lsp.buf.signature_help, attach_opts)
    -- rename
    vim.keymap.set("n", "gr", "<cmd>Lspsaga rename<CR>")
    -- go to implementation
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, attach_opts)
    -- peek definition
    vim.keymap.set("n", "gD", "<cmd>Lspsaga peek_definition<CR>")
    -- goto_definition
    vim.keymap.set("n", "gd", "<cmd>Lspsaga goto_definition<CR>")
    -- show line diagnostic
    vim.keymap.set("n", "ge", "<cmd>Lspsaga show_line_diagnostics<CR>")
    -- Diagnostic jump
    -- You can use <C-o> to jump back to your previous location
    vim.keymap.set("n", "[e", "<cmd>Lspsaga diagnostic_jump_prev<CR>")
    vim.keymap.set("n", "]e", "<cmd>Lspsaga diagnostic_jump_next<CR>")

    vim.api.nvim_create_user_command("Format", vim.lsp.buf.format, {})

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
        vim.keymap.set("n", "<leader>ga", "<cmd>Lspsaga code_action<CR>")
    end
end

function M.custom_on_init()
    -- print "Language Server Protocol started!"
    utils.info("Language Server Protocol started!", "LSP")
end

return M
