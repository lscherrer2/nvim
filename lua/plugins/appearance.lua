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
        config = function(_, opts)
            require("lualine").setup(opts)
            vim.opt.cmdheight = 0
        end,
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
    {
        "AstroNvim/astrotheme",
        opts = {
            palette = "astrodark",
            highlights = {
                global = {
                    modify_hl_groups = function(hl, c)
                        hl.Normal = { bg = "#0a0a0a" }
                        hl.NormalNC = { bg = "#0a0a0a" }
                        hl.NormalFloat = { bg = "#0a0a0a" }
                        hl.SignColumn = { bg = "#0a0a0a" }
                    end,
                },
            },
        },
    },
}
