-- Window Navigation
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")

-- Window Resizing
vim.keymap.set('n', '<A-Up>',    ':resize +2<CR>')
vim.keymap.set('n', '<A-Down>',  ':resize -2<CR>')
vim.keymap.set('n', '<A-Left>',  ':vertical resize -2<CR>')
vim.keymap.set('n', '<A-Right>', ':vertical resize +2<CR>')

-- Show all diagnostics in quickfix
vim.keymap.set("n", "<leader>q", vim.diagnostic.setqflist)
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(ev)
    local opts = { buffer = ev.buf, silent = true }

    local map = function(mode, lhs, rhs)
      vim.keymap.set(mode, lhs, rhs, opts)
    end

    map("n", "gd", vim.lsp.buf.definition)
    map("n", "gD", vim.lsp.buf.declaration)

    map("n", "K", vim.lsp.buf.hover)
    set("n", "gl", vim.diagnostic.open_float)
    map("n", "gr", vim.lsp.buf.references)
    map("n", "gi", vim.lsp.buf.implementation)

    map("n", "gr", vim.lsp.buf.rename)
    map("n", "[d", vim.diagnostic.goto_prev)
    map("n", "]d", vim.diagnostic.goto_next)

    map("n", "gf", function()
        vim.lsp.buf.format({ async = true })
    end)

end,
})

