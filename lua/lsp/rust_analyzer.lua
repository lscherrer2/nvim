return {
    capabilities = require("cmp_nvim_lsp").default_capabilities(),
    settings = {
        ["rust-analyzer"] = {
            cargo = { allFeatures = true },
            check = { command = "clippy" },
        },
    },
}
