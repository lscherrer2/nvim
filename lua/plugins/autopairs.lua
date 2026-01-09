return {
    {
        "windwp/nvim-autopairs",
        lazy = false,
        opts = {
            check_ts = true,
        },
    },
    {
        "windwp/nvim-ts-autotag",
        dependencies = { "nvim-treesitter/nvim-treesitter" },
        opts = {
            opts = {
                enable_close = true,
                enable_rename = true,
                enable_close_on_slash = true,
            },
        },
    },
}
