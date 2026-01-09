vim.keymap.set("n", "<leader>q", function()
    local qf_exists = false
    for _, win in pairs(vim.fn.getwininfo()) do
        if win["quickfix"] == 1 then
            qf_exists = true
        end
    end
    if qf_exists then
        vim.cmd("cclose")
    else
        vim.cmd("copen")
    end
end, { desc = "Toggle quickfix list" })

vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(ev)
        local opts = { buffer = ev.buf, silent = true }

        local map = function(mode, lhs, rhs, desc)
            local map_opts = vim.tbl_extend("force", opts, { desc = desc })
            vim.keymap.set(mode, lhs, rhs, map_opts)
        end

        map("n", "gd", vim.lsp.buf.definition, "Go to definition")
        map("n", "gD", vim.lsp.buf.declaration, "Go to declaration")

        map("n", "K", vim.lsp.buf.hover, "Hover documentation")
        map("n", "gl", vim.diagnostic.open_float, "Open diagnostic float")
        map("n", "gr", vim.lsp.buf.references, "Show references")
        map("n", "gi", vim.lsp.buf.implementation, "Go to implementation")

        map("n", "gr", vim.lsp.buf.rename, "Rename symbol")
        map("n", "[d", function()
            vim.diagnostic.jump({ count = 1, float = true })
        end, "Next diagnostic")
        map("n", "]d", function()
            vim.diagnostic.jump({ count = -1, float = true })
        end, "Previous diagnostic")
    end,
})
