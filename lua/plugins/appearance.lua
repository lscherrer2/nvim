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
                -- Fix missing @keyword.operator highlight (affects C++ new/delete, etc.)
                ["@keyword.operator"] = { fg = "#569CD6", bg = "NONE" },
                -- Disable LSP semantic token for operators in C++ so treesitter's
                -- @keyword.operator takes precedence for new/delete keywords
                ["@lsp.type.operator.cpp"] = {},
            },
        },
    },
    {
        "akinsho/bufferline.nvim",
        version = "*",
        dependencies = "nvim-tree/nvim-web-devicons",
        opts = {
            options = {
                mode = "buffers",
                themable = true,
                numbers = "none",
                close_command = "bdelete! %d",
                right_mouse_command = "bdelete! %d",
                left_mouse_command = "buffer %d",
                middle_mouse_command = nil,
                indicator = {
                    icon = "▎",
                    style = "icon",
                },
                buffer_close_icon = "×",
                modified_icon = "●",
                close_icon = "×",
                left_trunc_marker = "",
                right_trunc_marker = "",
                max_name_length = 15,
                max_prefix_length = 12,
                truncate_names = true,
                tab_size = 15,
                diagnostics = "nvim_lsp",
                diagnostics_update_in_insert = false,
                diagnostics_indicator = function(count, level, diagnostics_dict, context)
                    local icon = level:match("error") and " " or " "
                    return " " .. icon .. count
                end,
                offsets = {
                    {
                        filetype = "NvimTree",
                        text = "File Explorer",
                        text_align = "center",
                        separator = true,
                    },
                },
                color_icons = true,
                show_buffer_icons = true,
                show_buffer_close_icons = false,
                show_close_icon = false,
                show_tab_indicators = true,
                show_duplicate_prefix = true,
                persist_buffer_sort = true,
                separator_style = "thin",
                enforce_regular_tabs = false,
                always_show_bufferline = true,
                hover = {
                    enabled = false,
                    delay = 200,
                    reveal = { "close" },
                },
                sort_by = "insert_after_current",
            },
        },
    },
}
