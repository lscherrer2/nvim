
-- Better window navigation
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move to below window" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move to above window" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })


-- Show full diagnostic message in a floating window

-- Show all diagnostics in quickfix
vim.keymap.set("n", "<leader>q", vim.diagnostic.setqflist, { desc = "Diagnostics in quickfix" })
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(ev)
    local opts = { buffer = ev.buf, silent = true }

    local map = function(mode, lhs, rhs)
      vim.keymap.set(mode, lhs, rhs, opts)
    end

    map("n", "gd", vim.lsp.buf.definition)
    map("n", "gD", vim.lsp.buf.declaration)
    map("n", "K", vim.lsp.buf.hover)
    map("n", "gr", vim.lsp.buf.references)
    map("n", "gi", vim.lsp.buf.implementation)
    map("n", "gt", vim.lsp.buf.type_definition)
    map("n", "<leader>rn", vim.lsp.buf.rename)
    map("n", "<leader>ca", vim.lsp.buf.code_action)
    map("v", "<leader>ca", vim.lsp.buf.code_action)
    map("n", "[d", vim.diagnostic.goto_prev)
    map("n", "]d", vim.diagnostic.goto_next)
    map("n", "<leader>f", function()
        vim.lsp.buf.format({ async = true })
    end)
    vim.keymap.set("n", "gl", vim.diagnostic.open_float, {
        desc = "Show diagnostic"
    })

    -- Auto-focus LSP hover window so scrolling works normally
    local origUtilOpenFloat = vim.lsp.util.open_floating_preview
    function vim.lsp.util.open_floating_preview(contents, syntax, opts_, ...)
        local bufnr, winid = origUtilOpenFloat(contents, syntax, opts_, ...)
        vim.api.nvim_set_current_win(winid)  -- focus the hover window
        return bufnr, winid
    end

    -- Close LSP hover popup with <Esc>
    vim.keymap.set("n", "<Esc>", function()
        for _, win in ipairs(vim.api.nvim_list_wins()) do
            local cfg = vim.api.nvim_win_get_config(win)
            if cfg.zindex then
                vim.api.nvim_win_close(win, true)
            end
        end
    end, { silent = true })
end,
})

-- Window resizing
local opts = { noremap = true, silent = true }
vim.keymap.set('n', '<A-Up>',    ':resize +2<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<A-Down>',  ':resize -2<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<A-Left>',  ':vertical resize -2<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<A-Right>', ':vertical resize +2<CR>', { noremap = true, silent = true })

