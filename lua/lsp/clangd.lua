local clangd_caps = vim.deepcopy(require("cmp_nvim_lsp").default_capabilities())
clangd_caps.offsetEncoding = { "utf-16" }
return {
    capabilities = clangd_caps,
    cmd = {
        "clangd",
        "--background-index",
        "--clang-tidy",
        "--completion-style=bundled",
        "--header-insertion=iwyu",
    },
}
