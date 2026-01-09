-- Rust-analyzer is so slow inlay-hints weren't working
-- This fixes that
vim.api.nvim_create_autocmd("LspProgress", {
    callback = function(args)
        local value = args.data.params.value
        if not value or value.kind ~= "end" then
            return
        end

        local client = vim.lsp.get_client_by_id(args.data.client_id)

        if client and client.name == "rust_analyzer" then
            if value.title == "Indexing" or value.title == "Loading" then
                for _, bufnr in
                    ipairs(vim.lsp.get_buffers_by_client_id(client.id))
                do
                    vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
                end
            end
        end
    end,
})
