return {
    "ggandor/leap.nvim",
    lazy = false,
    config = function()
        vim.keymap.set("n", "-", "<Plug>(leap-anywhere)")
    end,
}
