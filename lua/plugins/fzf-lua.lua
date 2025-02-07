return {
    "ibhagwan/fzf-lua",
    event = "BufEnter",
    dependencies = { "echasnovski/mini.icons" },
    config = function()
        local fzf = require("fzf-lua")
        fzf.setup({

        })
        fzf.register_ui_select()
    end,
    keys = {
        {
            "<leader>f",
            group = "find",
            desc = "Find",
        },
        {
            "<leader>fb",
            function() require("fzf-lua").buffers() end,
            desc = "Buffers"
        },
        {
            "<leader>ff",
            function() require("fzf-lua").files() end,
            desc = "Files"
        },
        {
            "<leader>fq",
            function() require("fzf-lua").quickfix() end,
            desc = "Quickfix"
        },
        {
            "<leader>fQ",
            function() require("fzf-lua").quickfix_stack() end,
            desc = "Quickfix stack"
        },
        {
            "<leader>fl",
            function() require("fzf-lua").loclist() end,
            desc = "Loclist"
        },
        {
            "<leader>fL",
            function() require("fzf-lua").loclist_stack() end,
            desc = "Loclist stack"
        },
        {
            "<leader>ft",
            function() require("fzf-lua").treesitter() end,
            desc = "Treesitter symbols"
        },
        {
            "<leader>fg",
            function() require("fzf-lua").grep_curbuf() end,
            desc = "Grep buffer"
        },
        {
            "<leader>fp",
            function() require("fzf-lua").live_grep_native() end,
            desc = "Grep project"
        },
        {
            "<C-f>",
            function() require("fzf-lua").grep_cword() end,
            desc = "Grep buffer"
        },
        {
            "<leader>g",
            group = "git",
            desc = "git"
        },
        {
            "<leader>gf",
            function() require("fzf-lua").git_files() end,
            desc = "Git files (FZF)"
        },
        {
            "<leader>gs",
            function() require("fzf-lua").git_status() end,
            desc = "Git status (FZF)"
        },
        {
            "<leader>gc",
            function() require("fzf-lua").git_commits() end,
            desc = "Git commits (FZF)"
        },
        {
            "<leader>gb",
            function() require("fzf-lua").git_blame() end,
            desc = "Git blame (FZF)"
        },
        {
            "<leader>gt",
            function() require("fzf-lua").git_tags() end,
            desc = "Git tags (FZF)"
        },
        {
            "<leader>gS",
            function() require("fzf-lua").git_stash() end,
            desc = "Git stash (FZF)"
        },
        {
            "<leader>fr",
            function() require("fzf-lua").lsp_references() end,
            desc = "References (LSP)"
        },
        {
            "<leader>fd",
            function() require("fzf-lua").lsp_definitions() end,
            desc = "Defintions (LSP)"
        },
        {
            "<leader>fD",
            function() require("fzf-lua").lsp_declarations() end,
            desc = "Declarations (LSP)"
        },
        {
            "<leader>ft",
            function() require("fzf-lua").lsp_typedefs() end,
            desc = "Type definitions (LSP)"
        },
        {
            "<leader>fi",
            function() require("fzf-lua").lsp_implementations() end,
            desc = "Implementations (LSP)"
        },
        {
            "<leader>fs",
            function() require("fzf-lua").lsp_document_symbols() end,
            desc = "Document symbols (LSP)"
        },
        {
            "<leader>fS",
            function() require("fzf-lua").lsp_workspace_symbols() end,
            desc = "Workspace symbols (LSP)"
        },
        {
            "<leader>fc",
            function() require("fzf-lua").lsp_code_actions() end,
            desc = "Code actions (LSP)"
        },
        {
            "<leader>fx",
            function() require("fzf-lua").diagnostics_document() end,
            desc = "Document diagnostics (LSP)"
        },
        {
            "<leader>fX",
            function() require("fzf-lua").diagnostics_workspace() end,
            desc = "Workspace diagnostics (LSP)"
        },
        {
            "<leader>fR",
            function() require("fzf-lua").resume() end,
            desc = "Resume last search"
        },
        {
            "<leader>H",
            function() require("fzf-lua").helptags() end,
            desc = "Search help tags"
        },
        {
            "<leader>M",
            function() require("fzf-lua").manpages() end,
            desc = "Search man pages"
        },
        {
            "<leader>fH",
            function() require("fzf-lua").highlights() end,
            desc = "Highlights"
        },
        {
            "<leader>fC",
            function() require("fzf-lua").command_history() end,
            desc = "Command history"
        },
        {
            "<leader>fh",
            function() require("fzf-lua").search_history() end,
            desc = "Search history"
        },
        {
            "<leader>fm",
            function() require("fzf-lua").marks() end,
            desc = "Marks"
        },
        {
            "<leader>fz",
            function() require("fzf-lua").changes() end,
            desc = "Changes"
        },
        {
            "<leader>fj",
            function() require("fzf-lua").jumps() end,
            desc = "Jumps"
        },
        {
            "<leader>f\"",
            function() require("fzf-lua").registers() end,
            desc = "Registers"
        },
        {
            "<leader>fk",
            function() require("fzf-lua").keymaps() end,
            desc = "Keymaps"
        },
        {
            "<C-x>",
            function() require("fzf-lua").spell_suggest() end,
            desc = "Spelling suggestions",
            mode = { "i", "n" },
        },
    }
}
