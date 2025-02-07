return {
    {
        "williamboman/mason.nvim",
        opts = {},
    },
    {
        "williamboman/mason-lspconfig.nvim",
        opts = {},
        config = function()
            require("mason-lspconfig").setup_handlers {
                function(server_name)
                    require("lspconfig")[server_name].setup {}
                end,

                -- ["rust_analyzer"] = function()
                -- require("rust-tools").setup {}
                -- end,
            }
        end

    },
    {
        "neovim/nvim-lspconfig",
        dependencies = { 'saghen/blink.cmp' },
        event = { "BufReadPre", "BufNewFile" },
        opts = {
            servers = {
                lua_ls = {},
                basedpyright = {},
            }
        },
        config = function(_, opts)
            local lspconfig = require("lspconfig")
            require("lspconfig.ui.windows").default_options.border = "rounded"

            for server, config in pairs(opts.servers) do
                config.capabilities = require("blink.cmp").get_lsp_capabilities(config.capabilities)
                lspconfig[server].setup(config)
            end
        end
    }
}
