local M = {}
local utils = require "utils"
local highlight_group = vim.api.nvim_create_augroup("user_lsp_document_highlight", { clear = false })

local function format_buffer()
    local conform_ok, conform = pcall(require, "conform")

    if conform_ok then
        conform.format { async = true, lsp_fallback = true }
        return
    end

    local clients = vim.lsp.get_clients { bufnr = 0 }
    for _, client in ipairs(clients) do
        if client.supports_method "textDocument/formatting" then
            vim.lsp.buf.format { async = true }
            return
        end
    end

    vim.notify("No attached formatter is available.", vim.log.levels.WARN)
end

if vim.fn.exists(":Format") == 0 then
    vim.api.nvim_create_user_command("Format", format_buffer, {})
end

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
    vim.keymap.set("n", "gh", "<cmd>Lspsaga finder<CR>", attach_opts)
    -- lsp outline window with symbols
    vim.keymap.set("n", "<F7>", "<cmd>Lspsaga outline<CR>", attach_opts)
    -- show function signature help
    vim.keymap.set("n", "gs", vim.lsp.buf.signature_help, attach_opts)
    -- rename
    vim.keymap.set("n", "gr", "<cmd>Lspsaga rename<CR>", attach_opts)
    -- go to implementation
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, attach_opts)
    -- peek definition
    vim.keymap.set("n", "gD", "<cmd>Lspsaga peek_definition<CR>", attach_opts)
    -- goto_definition
    vim.keymap.set("n", "gd", "<cmd>Lspsaga goto_definition<CR>", attach_opts)
    -- show line diagnostic
    vim.keymap.set("n", "ge", "<cmd>Lspsaga show_line_diagnostics<CR>", attach_opts)
    -- Diagnostic jump
    -- You can use <C-o> to jump back to your previous location
    vim.keymap.set("n", "[e", "<cmd>Lspsaga diagnostic_jump_prev<CR>", attach_opts)
    vim.keymap.set("n", "]e", "<cmd>Lspsaga diagnostic_jump_next<CR>", attach_opts)

    -- Server capabilities spec:
    -- https://microsoft.github.io/language-server-protocol/specifications/lsp/3.17/specification/#serverCapabilities
    -- print(dump(client.server_capabilities))

    if client.supports_method "textDocument/documentHighlight" then
        vim.api.nvim_clear_autocmds { buffer = bufnr, group = highlight_group }
        vim.api.nvim_create_autocmd("CursorHold", {
            callback = vim.lsp.buf.document_highlight,
            buffer = bufnr,
            group = highlight_group,
            desc = "Document Highlight",
        })
        vim.api.nvim_create_autocmd("CursorMoved", {
            callback = vim.lsp.buf.clear_references,
            buffer = bufnr,
            group = highlight_group,
            desc = "Clear All the References",
        })
    end

    if client.supports_method "textDocument/codeAction" then
        vim.keymap.set("n", "<leader>ga", "<cmd>Lspsaga code_action<CR>", attach_opts)
    end
end

function M.custom_on_init()
    -- print "Language Server Protocol started!"
    utils.info("Language Server Protocol started!", "LSP")
end

return M
