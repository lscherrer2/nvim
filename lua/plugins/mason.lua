return {
    {
        "mason-org/mason.nvim",
        -- Ensure common formatters are installed via mason
        ensure_installed = {
            "prettier",
            "stylua",
            "ruff",
            "clang-format",
            "rustfmt",
        },
        opts = {},
    },
    {
        "mason-org/mason-lspconfig.nvim",
        ensure_installed = {
            "rust_analyzer",
            "basedpyright",
            "clangd",
            "lua_ls",
        },
        dependencies = {
            "mason-org/mason.nvim",
            "neovim/nvim-lspconfig",
        },
        opts = {},
    },
}
