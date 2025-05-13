local augroup = vim.api.nvim_create_augroup("jmattner/autocmds/lsp-attach", { clear = true })
local icons = require("config/icons")

local function diagnostics()
    vim.diagnostic.config({
        float = {
            border = "single",
        },
        jump = {
            float = true,
        },
        severity_sort = true,
        signs = {
            text = {
                [vim.diagnostic.severity.ERROR] = icons.diagnostics.error,
                [vim.diagnostic.severity.WARN] = icons.diagnostics.warning,
                [vim.diagnostic.severity.INFO] = icons.diagnostics.information,
                [vim.diagnostic.severity.HINT] = icons.diagnostics.hint,
            },
            numhl = {
                [vim.diagnostic.severity.ERROR] = "DiagnosticSignError",
                [vim.diagnostic.severity.WARN] = "DiagnosticSignWarn",
                [vim.diagnostic.severity.INFO] = "DiagnosticSignInfo",
                [vim.diagnostic.severity.HINT] = "DiagnosticSignHint",
            },
        },
        underline = true,
        update_in_insert = false,
        virtual_text = {
            spacing = 4,
            source = "if_many",
            prefix = "●",
            severity = {
                vim.diagnostic.severity.WARN,
                vim.diagnostic.severity.ERROR,
            },
            current_line = false,
        },
    })
end

local function keymaps(bufnr, client)
    local snacks = require("snacks")

    local k = function(keys, func, desc, mode)
        mode = mode or "n"
        vim.keymap.set(mode, keys, func, { buffer = bufnr, desc = "LSP: " .. desc })
    end
    local methods = vim.lsp.protocol.Methods

    -- https://neovim.io/doc/user/lsp.html#lsp-defaults
    k("gd", function() snacks.picker.lsp_definitions() end, "Go to definition")
    k("gD", function() snacks.picker.lsp_declarations() end, "Go to declaration")
    k("gr", function() snacks.picker.lsp_references() end, "Go to references")
    k("gi", function() snacks.picker.lsp_implementations() end, "Go to implementations")
    k("gs", function() snacks.picker.lsp_symbols() end, "Go to symbols")
    k("gS", function() snacks.picker.lsp_workspace_symbols() end, "Go to workspace symbols")
    k("<leader>.", function() vim.lsp.buf.code_action() end, "Go to workspace symbols")

    if client.supports_method(methods.textDocument_typeDefinition) then
        k("gy", function() snacks.picker.lsp_type_definitions() end, "Go to type definition")
    end
end

local function highlight_references(bufnr, client)
    local methods = vim.lsp.protocol.Methods

    if not client.supports_method(methods.textDocument_documentHighlight) then
        return
    end

    vim.api.nvim_create_autocmd({ "CursorHold", "InsertLeave" }, {
        buffer = bufnr,
        group = augroup,
        callback = vim.lsp.buf.document_highlight,
        desc = "Highlight references under the cursor",
    })

    vim.api.nvim_create_autocmd({ "CursorMoved", "InsertEnter", "BufLeave" }, {
        buffer = bufnr,
        group = augroup,
        callback = vim.lsp.buf.clear_references,
        desc = "Clear highlight references",
    })
end

local function clear_highlight_references(bufnr, client)
    local methods = vim.lsp.protocol.Methods

    if client.supports_method(methods.textDocument_documentHighlight) then
        vim.api.nvim_clear_autocmds({
            group = augroup,
            event = { "BufLeave", "CursorHold", "CursorMoved", "InsertEnter", "InsertLeave" },
            buffer = bufnr,
        })
    end
end

vim.api.nvim_create_autocmd("LspAttach", {
    group = augroup,
    pattern = "*",
    callback = function(event)
        if vim.g.vscode then
            return
        end

        local bufnr = event.buf
        local client = vim.lsp.get_client_by_id(event.data.client_id)
        if not client then
            return
        end

        diagnostics()
        keymaps(bufnr, client)
        highlight_references(bufnr, client)
    end,
})

vim.api.nvim_create_autocmd("LspDetach", {
    group = augroup,
    callback = function(event)
        if vim.g.vscode then
            return
        end

        local bufnr = event.buf
        local client = vim.lsp.get_client_by_id(event.data.client_id)
        if not client then
            return
        end

        clear_highlight_references(bufnr, client)
    end,
})

vim.api.nvim_create_user_command("LspLog", function()
    vim.cmd.edit(vim.lsp.log.get_filename())
end, { desc = "Open lsp.log file" })
