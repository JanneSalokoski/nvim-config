return {
    "catppuccin/nvim",
    name = "catppuccin",
    config = function()
        require("catppuccin").setup({

            flavour = "mocha",
            dim_inactive = {
                enabled = true,
                shade = "dark",
                percentage = 0.15,
            },
            custom_highlights = function(colors)
                return {
                    ---@diagnostic disable-next-line: undefined-field
                    MiniIndentscopeSymbol = { fg = colors.surface },
                }
            end,
            styles = {
                comments = {},
            },
            default_integrations = true,
            integrations = {
                blink_cmp = true,
                fzf = true,
                gitsigns = true,
                harpoon = true,
                markdown = true,
                mason = true,
                treesitter_context = true,
                overseer = true,
                snacks = true,
                which_key = true,
                treesitter = true,
                notify = true,
                mini = {
                    enabled = false,
                }
            }
        })

        vim.cmd("colorscheme catppuccin")
    end
}
