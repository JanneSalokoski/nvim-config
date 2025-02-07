return {
    "nvim-lualine/lualine.nvim",
    opts = {
        theme = "catppuccin",
        options = {
            section_separators = " ",
            component_separators = " ",
        },
        sections = {
            lualine_a = { "mode" },
            lualine_b = { "diff", "diagnostics" },
            lualine_c = {},
            lualine_x = { "filetype" },
            lualine_y = {},
            lualine_z = { "location" },
        },
        winbar = {
            lualine_a = {
                "branch"
            },
            lualine_c = {
                "%=",
                {
                    "windows",
                    show_filename_only = false,
                    show_modified_status = true,
                    mode = 0,
                    use_mode_colors = true,
                },
            },
            lualine_z = {
                "progress"
            },
        }
    },
}
