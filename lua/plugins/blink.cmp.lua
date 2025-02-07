local icons = require("config.icons")

return {
    "saghen/blink.cmp",
    dependencies = {
        "LuaSnip",
        "mikavilpas/blink-ripgrep.nvim"
    },
    build = "cargo +nightly build --release",
    event = "InsertEnter",
    opts = {
        keymap = {
            ["<Tab>"] = { "select_next", "snippet_forward", "fallback" },
            ["<S-Tab>"] = { "select_prev", "snippet_backward", "fallback" },
            ["<CR>"] = {
                function(cmp)
                    local comp_list = require("blink.cmp.completion.list")
                    if comp_list.get_selected_item() ~= nil then
                        cmp.accept()
                        return true
                    else
                        return false
                    end
                end,
                "fallback"
            },
            ["<C-space>"] = { "show_documentation", "hide_documentation" },
            ["<C-k>"] = { "scroll_documentation_up", "fallback" },
            ["<C-j>"] = { "scroll_documentation_down", "fallback" },
            cmdline = {
                ["<CR>"] = { "fallback" },
            },
        },
        completion = {
            keyword = {
                range = "full"
            },
            accept = {
                auto_brackets = {
                    enabled = true,
                },
            },
            list = {
                selection = { preselect = false, auto_insert = true },
                max_items = 5,
            },
            menu = {
                auto_show = true,
                border = "rounded",
                draw = {
                    treesitter = { "lsp" },
                    components = {
                        kind_icon = {
                            ellipsis = false,
                            text = function(ctx)
                                local kind_icon, _, _ = require("mini.icons").get("lsp", ctx.kind)
                                return kind_icon
                            end,
                            highlight = function(ctx)
                                local _, hl, _ = require("mini.icons").get("lsp", ctx.kind)
                                return hl
                            end
                        }
                    },
                    columns = {
                        { "label",     "label_description", gap = 1 },
                        { "kind_icon", "kind",              gap = 1, }
                    }
                }
            },
            documentation = {
                auto_show = true,
                auto_show_delay_ms = 100,
            },
            ghost_text = {
                enabled = true
            },
        },
        snippets = { preset = "luasnip" },
        sources = {
            default = { "lsp", "path", "snippets", "ripgrep", "buffer" },
            cmdline = { "path" },
            providers = {
                ripgrep = {
                    module = "blink-ripgrep",
                    name = "RipGrep",
                    opts = {},
                    transform_items = function(_, items)
                        for _, item in ipairs(items) do
                            item.labelDetails = {
                                description = "rg"
                            }
                        end
                        return items
                    end
                }
            }
        },
        appearance = {
            kind_icons = icons.symbol_kinds,
        },
        signature = { enabled = true }
    },
}
