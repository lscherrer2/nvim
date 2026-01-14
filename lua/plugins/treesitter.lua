return {
    {
        "nvim-treesitter/nvim-treesitter",
        lazy = false,
        build = ":TSUpdate",
        opts = {
            ensure_installed = {
                "javascript",
                "typescript",
                "tsx",
            },
            highlight = {
                enable = true,
            },
            indent = {
                enable = true,
            },
        },
    },
    {
        "nvim-treesitter/nvim-treesitter-context",
        opts = {},
        keys = {
            {
                "[c",
                function()
                    require("treesitter-context").go_to_context(vim.v.count1)
                end,
                desc = "Go to context",
            },
        },
    },
}
