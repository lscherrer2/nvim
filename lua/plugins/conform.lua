return {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    keys = {
        {
            "gf",
            function()
                require("conform").format({ async = true, lsp_fallback = true })
            end,
            mode = "",
            desc = "Format buffer",
        },
    },
    opts = {
        formatters_by_ft = {
            lua = { "stylua" },
            python = { "ruff_fix", "ruff_format" },
            rust = { "rustfmt" },
            cpp = { "clang-format" },
            c = { "clang-format" },
            json = { "prettier" },
        },
        format_on_save = {
            timeout_ms = 500,
            lsp_fallback = true,
        },
        stop_after_first = false,
    },
}
