return {
    {
        "echasnovski/mini.ai",
        version = false,
        opts = {}
    },
    {
        "echasnovski/mini.operators",
        version = false,
        opts = {}
    },
    {
        "echasnovski/mini.pairs",
        version = false,
        opts = {}
    },
    {
        "echasnovski/mini.surround",
        version = false,
        opts = {}
    },
    {
        "echasnovski/mini.basics",
        version = false,
        opts = {}
    },
    {
        "echasnovski/mini.bracketed",
        version = false,
        opts = {}
    },
    {
        "echasnovski/mini.bufremove",
        version = false,
        opts = {}
    },
    -- {
    --     "echasnovski/mini.jump2d",
    --     version = false,
    --     opts = {}
    -- },
    {
        "echasnovski/mini.hipatterns",
        version = false,
        opts = {}
    },
    {
        "echasnovski/mini.indentscope",
        version = false,
        config = function()
            local indentscope = require("mini.indentscope")
            indentscope.setup({
                draw = {
                    delay = 0,
                    animation = require("mini.indentscope").gen_animation.none()
                },
                symbol = "|",
                try_as_border = true,
            })
        end,
    },
    {
        "echasnovski/mini.icons",
        version = false,
        opts = {}
    },
}
