local M = {}
local highlight_group = vim.api.nvim_create_augroup("user_lsp_document_highlight", { clear = false })
local diagnostic_float = { border = "rounded", source = "if_many", scope = "line" }

local function format_buffer()
    local conform_ok, conform = pcall(require, "conform")

    if conform_ok then
        conform.format { async = true, lsp_format = "fallback" }
        return
    end

    local clients = vim.lsp.get_clients { bufnr = 0 }
    for _, client in ipairs(clients) do
        if client:supports_method "textDocument/formatting" then
            vim.lsp.buf.format { async = true }
            return
        end
    end

    vim.notify("No attached formatter is available.", vim.log.levels.WARN)
end

if vim.fn.exists ":Format" == 0 then
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

    local function opts(desc)
        return vim.tbl_extend("force", attach_opts, { desc = desc })
    end

    -- references picker
    vim.keymap.set("n", "gh", function()
        Snacks.picker.lsp_references()
    end, opts "LSP references")
    -- document symbols picker
    vim.keymap.set("n", "<F7>", function()
        Snacks.picker.lsp_symbols()
    end, opts "LSP symbols")
    -- show function signature help
    vim.keymap.set("n", "gs", vim.lsp.buf.signature_help, attach_opts)
    -- implementations picker
    vim.keymap.set("n", "gi", function()
        Snacks.picker.lsp_implementations()
    end, opts "LSP implementations")
    -- go to declaration
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts "LSP declaration")
    -- definitions picker (jumps directly when there is a single result)
    vim.keymap.set("n", "gd", function()
        Snacks.picker.lsp_definitions()
    end, opts "LSP definitions")
    -- show line diagnostic
    vim.keymap.set("n", "ge", function()
        vim.diagnostic.open_float(nil, diagnostic_float)
    end, attach_opts)
    -- Diagnostic jump
    -- You can use <C-o> to jump back to your previous location
    vim.keymap.set("n", "[e", function()
        vim.diagnostic.jump { count = -1, float = diagnostic_float }
    end, attach_opts)
    vim.keymap.set("n", "]e", function()
        vim.diagnostic.jump { count = 1, float = diagnostic_float }
    end, attach_opts)

    -- Server capabilities spec:
    -- https://microsoft.github.io/language-server-protocol/specifications/lsp/3.17/specification/#serverCapabilities
    -- print(dump(client.server_capabilities))

    if client:supports_method "textDocument/documentHighlight" then
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

    if client:supports_method "textDocument/codeAction" then
        vim.keymap.set({ "n", "v" }, "<leader>ga", vim.lsp.buf.code_action, attach_opts)
    end
end

return M
