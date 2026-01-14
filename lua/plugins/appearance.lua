return {
    {
        "sainnhe/gruvbox-material",
        lazy = false,
        priority = 1000,
        config = function()
            vim.g.gruvbox_material_background = "soft" -- medium, hard, soft
            vim.g.gruvbox_material_foreground = "material" -- material, mix, original
            vim.g.gruvbox_material_enable_bold = 1
            vim.g.gruvbox_material_enable_italic = 1
            vim.o.background = "dark"
            vim.cmd.colorscheme("gruvbox-material")
        end,
    },
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        opts = {
            options = {
                theme = "auto",
            },
        },
    },
    {
        "Mofiqul/vscode.nvim",
        opts = {
            group_overrides = {
                ["@keyword.operator"] = { fg = "#569CD6", bg = "NONE" },
                ["@lsp.type.operator.cpp"] = {},
            },
        },
    },
}
