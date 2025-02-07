return {
    "lewis6991/gitsigns.nvim",
    event = "BufEnter",
    opts = {
        signs_staged_enable = true,
        signcolumn = true,
        numhl = true,
        linehl = false,
        word_diff = false,
        watch_gitdir = {
            follow_files = true
        },
        current_line_blame = true,
        preview_config = {
            border = "rounded"
        },
        auto_attach = true,
        attach_to_untracked = true,
    },
    keys = {
        {
            "[g",
            function() require("gitsigns").nav_hunk("prev") end,
            desc = "Previous hunk",
        },
        {
            "]g",
            function() require("gitsigns").nav_hunk("next") end,
            desc = "Next hunk",
        },
        {
            "<leader>gb",
            function() require("gitsigns").blame_line() end,
            desc = "Blame line",
        },
        {
            "<leader>gp",
            function() require("gitsigns").preview_hunk() end,
            desc = "Preview hunk",
        },
        {
            "<leader>gi",
            function() require("gitsigns").preview_hunk_inline() end,
            desc = "Preview hunk inline",
        },
        {
            "<leader>gr",
            function() require("gitsigns").reset_hunk() end,
            desc = "Reset hunk",
        },
        {
            "<leader>gR",
            function() require("gitsigns").reset_buffer() end,
            desc = "reset buffer",
        },
        {
            "<leader>gs",
            function() require("gitsigns").stage_hunk() end,
            desc = "Stage hunk",
        },
        {
            "<leader>gS",
            function() require("gitsigns").stage_buffer() end,
            desc = "Stage buffer",
        },
        {
            "<leader>gd",
            function() require("gitsigns").diffthis() end,
            desc = "Git diff",
        },
        {
            "<leader>gD",
            function() require("gitsigns").diffthis("~") end,
            desc = "Git diff",
        },
        {
            "<leader>gt",
            group = "Toggle gitsigns features"
        },
        {
            "<leader>gtb",
            function() require("gitsigns").toggle_current_line_blame() end,
            desc = "Toggle current line blame",
        },
        {
            "<leader>gtw",
            function() require("gitsigns").toggle_word_diff() end,
            desc = "Toggle word diff",
        },

    }
}
