return {
    {
        "nvim-treesitter/nvim-treesitter-context",
        opts = {
            max_lines = 3,
            multiline_threshold = 1,
            min_window_height = 20,
        }
    },
    {
        "nvim-treesitter/nvim-treesitter",
        dependencies = {
            "nvim-treesitter-context"
        },
        event = "VeryLazy",
        version = false,
        build = ":TSUpdate",
        opts = {
            ensure_installed = {
                "bash",
                "c",
                "cpp",
                "css",
                "fish",
                "gitcommit",
                "html",
                "javascript",
                "json",
                "lua",
                "markdown",
                "markdown_inline",
                "python",
                "query",
                "regex",
                "rust",
                "toml",
                "tsx",
                "typescript",
                "vim",
                "vimdoc",
                "yaml",
            },
            highlight = {
                enable = true
            },
            incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection = "<cr>",
                    node_incremental = "<cr>",
                    scope_incremental = false,
                    node_decremental = "<bs>",
                },
            },
            indent = {
                enable = true,
                disable = { "yaml" },
            },
        },
        config = function(_, opts)
            local toggle_inc_selection_group =
                vim.api.nvim_create_augroup('mariasolos/toggle_inc_selection', { clear = true })
            vim.api.nvim_create_autocmd('CmdwinEnter', {
                desc = 'Disable incremental selection when entering the cmdline window',
                group = toggle_inc_selection_group,
                command = 'TSBufDisable incremental_selection',
            })
            vim.api.nvim_create_autocmd('CmdwinLeave', {
                desc = 'Enable incremental selection when leaving the cmdline window',
                group = toggle_inc_selection_group,
                command = 'TSBufEnable incremental_selection',
            })

            require('nvim-treesitter.configs').setup(opts)
        end,

    }
}
