local diag_icons = require("config.icons").diagnostics
local methods = vim.lsp.protocol.Methods

---@diagnostic disable-next-line: unused-local
local M = {}

vim.g.inlay_hints = false

---@param client vim.lsp.Client
---@param bufnr integer
local function on_attach(client, bufnr)
    ---@param lhs string
    ---@param rhs string|function
    ---@param desc string
    ---@param mode? string|string[]
    local function keymap(lhs, rhs, desc, mode)
        mode = mode or "n"
        vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
    end

    -- Set up code action lightbulb
    require("config.lightbulb").attach_lightbulb(bufnr, client.id)

    keymap(
        "[d",
        function()
            vim.diagnostic.jump({ count = -1 })
        end,
        "Previous diagnostic"
    )
    keymap(
        "]d",
        function()
            vim.diagnostic.jump({ count = 1 })
        end,
        "Next diagnostic"
    )
    keymap(
        "[e",
        function()
            vim.diagnostic.jump({ count = -1, severity = vim.diagnostic.severity.ERROR })
        end,
        "Previous error"
    )
    keymap(
        "]e",
        function()
            vim.diagnostic.jump({ count = 1, severity = vim.diagnostic.severity.ERROR })
        end,
        "Next error"
    )

    if client:supports_method(methods.textDocument_signatureHelp) then
        keymap("<C-s>", function()
            vim.lsp.buf.signature_help()
        end, "Signature help", { "i", "n" })

        keymap("<C-h>", function()
            vim.lsp.buf.hover()
        end, "LSP hover", { "i", "n" })

        keymap("<C-a>", function()
            vim.lsp.buf.code_action()
        end, "LSP code action", { "i", "n" })
    end


    vim.api.nvim_create_autocmd('ColorScheme', {
        callback = function()
            vim.api.nvim_set_hl(0, 'LspReferenceTarget', {})
        end,
    })

    vim.api.nvim_create_autocmd("BufWritePre", {
        pattern = "*",
        callback = function()
            vim.lsp.buf.format()
        end,
    })

    if client:supports_method(methods.textDocument_documentHighlight) then
        local under_cursor_highlights_group =
            vim.api.nvim_create_augroup('mariasolos/cursor_highlights', { clear = false })
        vim.api.nvim_create_autocmd({ 'CursorHold', 'InsertLeave' }, {
            group = under_cursor_highlights_group,
            desc = 'Highlight references under the cursor',
            buffer = bufnr,
            callback = vim.lsp.buf.document_highlight,
        })
        vim.api.nvim_create_autocmd({ 'CursorMoved', 'InsertEnter', 'BufLeave' }, {
            group = under_cursor_highlights_group,
            desc = 'Clear highlight references',
            buffer = bufnr,
            callback = vim.lsp.buf.clear_references,
        })
    end

    if client:supports_method(methods.textDocument_inlayHint) and vim.g.inlay_hints then
        local inlay_hints_group = vim.api.nvim_create_augroup('mariasolos/toggle_inlay_hints', { clear = false })

        -- Initial inlay hint display.
        -- Idk why but without the delay inlay hints aren't displayed at the very start.
        vim.defer_fn(function()
            local mode = vim.api.nvim_get_mode().mode
            vim.lsp.inlay_hint.enable(mode == 'n' or mode == 'v', { bufnr = bufnr })
        end, 500)

        vim.api.nvim_create_autocmd('InsertEnter', {
            group = inlay_hints_group,
            desc = 'Enable inlay hints',
            buffer = bufnr,
            callback = function()
                if vim.g.inlay_hints then
                    vim.lsp.inlay_hint.enable(false, { bufnr = bufnr })
                end
            end,
        })

        vim.api.nvim_create_autocmd('InsertLeave', {
            group = inlay_hints_group,
            desc = 'Disable inlay hints',
            buffer = bufnr,
            callback = function()
                if vim.g.inlay_hints then
                    vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
                end
            end,
        })
    end
end

-- Define diagnostic signs
for severity, icon in pairs(diag_icons) do
    local hl = "DiagnosticSign" .. severity:sub(1, 1) .. severity:sub(2):lower()
    vim.fn.sign_define(hl, { text = icon, texthl = hl })
end

vim.diagnostic.config {
    virtual_text = {
        prefix = "",
        spacing = 2,
        format = function(diagnostic)
            local special_sources = {
                ["Lua Diagnostics."] = "lua",
                ["Lua Syntax Check."] = "lua",
            }
            local message = diag_icons[vim.diagnostic.severity[diagnostic.severity]]
            if diagnostic.source then
                message = string.format("%s %s", message,
                    special_sources[diagnostic.source] or diagnostic.source)
            end
            if diagnostic.code then
                message = string.format("%s[%s]", message, diagnostic.code)
            end

            return message .. " "
        end,
    },
    float = {
        border = "rounded",
        source = "if_many",
        prefix = function(diag)
            local level = vim.diagnostic.severity[diag.severity]
            local prefix = string.format(" %s ", diag_icons[level])
            return prefix, "Diagnostic" .. level:gsub("^%1", string.upper)
        end,
    },
    signs = false
}

local show_handler = vim.diagnostic.handlers.virtual_text.show
assert(show_handler)
local hide_handler = vim.diagnostic.handlers.virtual_text.hide
vim.diagnostic.handlers.virtual_text = {
    show = function(ns, bufnr, diagnostics, opts)
        table.sort(diagnostics, function(diag1, diag2)
            return diag1.severity > diag2.severity
        end)
        return show_handler(ns, bufnr, diagnostics, opts)
    end,
    hide = hide_handler,
}

local hover = vim.lsp.buf.hover
---@diagnostic disable-next-line: duplicate-set-field
vim.lsp.buf.hover = function()
    return hover {
        border = 'rounded',
        max_height = math.floor(vim.o.lines * 0.8),
        max_width = math.floor(vim.o.columns * 0.8),
    }
end

local signature_help = vim.lsp.buf.signature_help
---@diagnostic disable-next-line: duplicate-set-field
vim.lsp.buf.signature_help = function()
    print()
    return signature_help {
        border = 'rounded',
        max_height = math.floor(vim.o.lines * 0.8),
        max_width = math.floor(vim.o.columns * 0.8),
    }
end

--- HACK: Override `vim.lsp.util.stylize_markdown` to use Treesitter.
---@param bufnr integer
---@param contents string[]
---@param opts table
---@return string[]
---@diagnostic disable-next-line: duplicate-set-field
vim.lsp.util.stylize_markdown = function(bufnr, contents, opts)
    contents = vim.lsp.util._normalize_markdown(contents, {
        width = vim.lsp.util._make_floating_popup_size(contents, opts),
    })
    vim.bo[bufnr].filetype = 'markdown'
    vim.treesitter.start(bufnr)
    vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, contents)

    return contents
end

-- Update mappings when registering dynamic capabilities.
local register_capability = vim.lsp.handlers[methods.client_registerCapability]
vim.lsp.handlers[methods.client_registerCapability] = function(err, res, ctx)
    local client = vim.lsp.get_client_by_id(ctx.client_id)
    if not client then
        return
    end

    on_attach(client, vim.api.nvim_get_current_buf())

    return register_capability(err, res, ctx)
end

vim.api.nvim_create_autocmd('LspAttach', {
    desc = 'Configure LSP keymaps',
    callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)

        -- I don't think this can happen but it's a wild world out there.
        if not client then
            return
        end

        on_attach(client, args.buf)
    end,
})
