return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {},
    keys = {
        {
            "<leader>?",
            function()
                require("which-key").show({ global = false })
            end,
            desc = "Buffer local keymaps",
        },
        {
            "<leader>!",
            function()
                require("which-key").show({ global = true })
            end,
            desc = "Global keymaps",
        },

        {
            "<leader>m",
            group = "marks"
        },
        {
            "<leader>md",
            function()
                local mark = vim.fn.getcharstr()
                vim.cmd("delmark " .. mark)
            end,
            desc = "Delete mark"
        },
        {
            "<leader>mm",
            function() require("fzf-lua").marks() end,
            desc = "Search marks (FZF)"
        },

        {
            "<leader>b",
            group = "buffers",
        },
        {
            "<leader>bp",
            "<cmd>:bprev<cr>",
            desc = "Previous buffer"
        },
        {
            "<leader>bn",
            "<cmd>:bnext<cr>",
            desc = "Next buffer"
        },
        {
            "<leader>L",
            "<cmd>:Lazy<cr>",
            desc = "Lazy"
        },
        {
            "<Esc>",
            "<cmd>:noh<cr>",
            desc = "Clear selection"
        }
    },
    config = function()
        local wk = require("which-key")
        wk.add({ "<leader>w", proxy = "<c-w>", group = "windows" }) -- proxy to window mapping
        wk.add(
            {
                "<leader>b",
                group = "buffers",
                expand = function()
                    return require("which-key.extras").expand.buf()
                end,
                desc = "Buffers",
            }
        )
    end
}
