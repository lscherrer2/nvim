return {
    {
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
    },
    {
        "princejoogie/tailwind-highlight.nvim",
        dependencies = { "nvim-treesitter/nvim-treesitter" },

        ft = {
            "html",
            "css",
            "scss",
            "javascript",
            "javascriptreact",
            "typescript",
            "typescriptreact",
            "vue",
            "svelte",
            "astro",
        },
        opts = {},
        config = function(_, opts)
            local ok, th = pcall(require, "tailwind-highlight")
            if not ok then
                return
            end
            local configured = false
            vim.api.nvim_create_autocmd("LspAttach", {
                callback = function(args)
                    if configured then
                        return
                    end
                    local client =
                        vim.lsp.get_client_by_id(args.data.client_id)
                    if not client then
                        return
                    end
                    if client.name ~= "tailwindcss" then
                        return
                    end

                    configured = true
                    th.setup(opts)
                end,
            })
        end,
    },
}
