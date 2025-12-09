-- lua/plugins/lsp-and-cmp.lua
return {
    -- Completion
    {
        "hrsh7th/nvim-cmp",
        event = "InsertEnter",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "L3MON4D3/LuaSnip",
            "saadparwaiz1/cmp_luasnip",
            "rafamadriz/friendly-snippets",
        },
        config = function()
            local cmp = require("cmp")
            local luasnip = require("luasnip")
            require("luasnip.loaders.from_vscode").lazy_load()

            cmp.setup({
                snippet = { expand = function(args) luasnip.lsp_expand(args.body) end },
                mapping = cmp.mapping.preset.insert({
                    ["<C-Space>"] = cmp.mapping.complete(),
                    ["<CR>"] = cmp.mapping.confirm({ select = true }),
                    ["<Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_next_item()
                        elseif luasnip.expand_or_jumpable() then
                            luasnip.expand_or_jump()
                        else
                            fallback()
                        end
                    end, { "i", "s" }),
                    ["<S-Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_prev_item()
                        elseif luasnip.jumpable(-1) then
                            luasnip.jump(-1)
                        else
                            fallback()
                        end
                    end, { "i", "s" }),
                    ["<C-e>"] = cmp.mapping.abort(),
                    ["<Esc>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.abort()
                            vim.api.nvim_feedkeys(
                                vim.api.nvim_replace_termcodes("<Esc>", true, false, true), 
                                "n",
                                false
                            )
                        else
                            fallback()
                        end
                    end, { "i", "c" }),
                }),
                sources = {
                    { name = "nvim_lsp" },
                    { name = "luasnip" },
                    { name = "path" },
                    { name = "buffer" },
                },
            })
        end,
    },

    -- Mason core
    {
        "williamboman/mason.nvim",
        build = ":MasonUpdate",
        config = true,
    },

    -- LSP configuration (Neovim 0.11+ API)
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = { "neovim/nvim-lspconfig", "williamboman/mason.nvim", "hrsh7th/cmp-nvim-lsp" },
        config = function()
            vim.lsp.handlers["textDocument/hover"] = function(err, result, ctx, config)
                if not (result and result.contents) then return end
                vim.lsp.util.open_floating_preview(
                    vim.lsp.util.convert_input_to_markdown_lines(result.contents),
                    "markdown",
                    {
                        max_width = 120,
                        max_height = 40,
                        border = "rounded",
                        wrap = true,
                    }
                )
            end
            -- Configure servers
            vim.lsp.config("basedpyright", require("lsp.basedpyright"))
            vim.lsp.config("lua_ls", require("lsp.lua_ls"))
            vim.lsp.config("clangd", require("lsp.clangd"))
            vim.lsp.config("rust_analyzer", require("lsp.rust_analyzer"))
            vim.lsp.config("gopls", require("lsp.gopls"))

            local mlsp = require("mason-lspconfig")
            mlsp.setup({
                ensure_installed = { "basedpyright", "lua_ls", "clangd", "rust_analyzer" },
                automatic_enable = true,
            })
        end,
    },

    { "neovim/nvim-lspconfig", lazy = true },
}
