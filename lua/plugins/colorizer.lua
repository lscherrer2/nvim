return {
    "NvChad/nvim-colorizer.lua",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
        user_default_options = {
            RGB = true,
            RRGGBB = true,
            names = false,
            css = true,
            css_fn = true,
            mode = "background",
        },
    },
}
