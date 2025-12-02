return {
    "stevearc/conform.nvim",
    opts = {
        formatters_by_ft = {
            python = { "ruff_format" },
        },
        formatters = {
            ruff_format = {
                command = vim.fn.stdpath("data") .. "/mason/bin/ruff",
                args = { "format", "--stdin-filename", "$FILENAME", "-" },
                stdin = true,
            },
        },
        format_on_save = {
            lsp_fallback = false, -- force ONLY Prettier, no LSP formatting
        },
    },
}
