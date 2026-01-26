return {
    {
        "nvim-treesitter/nvim-treesitter",
        dependencies = "neovim/nvim-lspconfig",
        lazy = false,
        build = ":TSUpdate",
        opts = {
            ensure_installed = {
                "tsx",
                "typescript",
                "javascript",
                "html",
                "css",
                "json",
                "lua",
            },
            highlight = {
                enable = true,
            },
            indent = {
                enable = true,
            },
        },
        config = function(_, opts)
            require("nvim-treesitter.configs").setup(opts)
        end,
    },
    {
        "nvim-treesitter/nvim-treesitter-context",
        dependencies = "nvim-treesitter/nvim-treesitter",
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
