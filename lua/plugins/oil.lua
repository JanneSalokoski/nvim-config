local detail = false

-- Declare a global function to retrieve the current directory
function _G.get_oil_winbar()
    local bufnr = vim.api.nvim_win_get_buf(vim.g.statusline_winid)
    local dir = require("oil").get_current_dir(bufnr)
    if dir then
        return vim.fn.fnamemodify(dir, ":~")
    else
        -- If there is no current directory (e.g. over ssh), just show the buffer name
        return vim.api.nvim_buf_get_name(0)
    end
end

return {
    "stevearc/oil.nvim",
    lazy = false,
    opts = {
        default_file_explorer = true,
        columns = {
            "icon",
        },
        skip_confirm_for_simple_events = true,
        lsp_file_methods = { enabled = true },
        constrain_cursor = "name",
        watch_for_changes = true,
        view_options = {
            show_hidden = true,
        },
        win_options = {
            winbar = "%!v:lua.get_oil_winbar()",
        },
        keymaps = {
            ["gd"] = {
                desc = "Toggle file details",
                callback = function()
                    detail = not detail
                    if detail then
                        require("oil").set_columns({
                            "icon", "permissions", "size", "mtime"
                        })
                    else
                        require("oil").set_columns({ "icon" })
                    end
                end,
            }
        }
    },
    keys = {
        {
            "<leader>O",
            "<CMD>Oil<CR>",
            desc = "Browse files",
        },
    }

}
