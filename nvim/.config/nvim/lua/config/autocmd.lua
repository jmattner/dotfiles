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
        vim.keymap.set(mode, keys, func, { buffer = bufnr, desc = desc })
    end
    local methods = vim.lsp.protocol.Methods

    -- https://neovim.io/doc/user/lsp.html#lsp-defaults
    k("grd", function()
        snacks.picker.lsp_definitions()
    end, "definition")
    k("grD", function()
        snacks.picker.lsp_declarations()
    end, "declaration")
    k("grr", function()
        snacks.picker.lsp_references()
    end, "references")
    k("gri", function()
        snacks.picker.lsp_implementations()
    end, "implementations")
    k("grs", function()
        snacks.picker.lsp_symbols()
    end, "symbols")
    k("grS", function()
        snacks.picker.lsp_workspace_symbols()
    end, "workspace symbols")
    k("gn", function()
        vim.diagnostic.jump({ count = 1 })
    end, "next diagnostic")
    k("gp", function()
        vim.diagnostic.jump({ count = -1 })
    end, "previous diagnostic")
    k("<leader>.", function()
        vim.lsp.buf.code_action()
    end, "workspace symbols")

    if client.supports_method(methods.textDocument_typeDefinition) then
        k("grt", function()
            snacks.picker.lsp_type_definitions()
        end, "type definition")
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
