return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
        bigfile = { enabled = true },
        debug = { enabled = true },
        dim = { enabled = true },
        git = { enabled = true },
        input = { enabled = false },
        lazygit = { enabled = true },
        notifier = { enabled = true },
        notify = { enabled = true },
        statuscolumn = {
            left = { "mark", "sign" }, -- priority of signs on the left (high to low)
            right = { "fold", "git" }, -- priority of signs on the right (high to low)
            folds = {
                open = true,           -- show open fold icons
                git_hl = true,         -- use Git Signs hl for fold icons
            },
            git = {
                -- patterns to match Git signs
                patterns = { "GitSign", "MiniDiffSign" },
            },
            refresh = 50, -- refresh at most every 50ms

        },
        terminal = { enabled = true },
        toggle = { enabled = true },
        zen = {
            toggles = {
                dim = true,
                git_signs = false,
                diagnostics = false,
                inlay_hints = false,
                statuscolumn = false,
            },
            show = {
                statusline = false,
                tabline = false,
            },
            on_open = function(win)
                vim.wo.number = false
                vim.wo.relativenumber = false
            end,
            on_close = function(win)
                vim.wo.number = true
                vim.wo.relativenumber = true
            end,
        }
    },
    keys = {
        {
            "<leader>gl",
            function() require("snacks").lazygit() end,
            desc = "Lazygit",
        },
        {
            "<leader>Z",
            function() require("snacks").zen() end,
            desc = "Zen mode"
        },
        {
            "<leader>.",
            function() require("snacks").scratch() end,
            desc = "Toggle scratch buffer"
        },
        {
            "<leader>h",
            function() require("snacks").notifier.show_history() end,
            desc = "Toggle scratch buffer (Lua)"
        },
        {
            "<leader>bd",
            function() require("snacks").bufdelete() end,
            desc = "Delete buffer"
        },
        {
            "<leader>T",
            function() require("snacks").terminal() end,
            desc = "Toggle terminal"
        },
    }
}
