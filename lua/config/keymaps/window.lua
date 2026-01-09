vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move to bottom window" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move to top window" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })

vim.keymap.set("n", "<A-k>", ":resize +2<CR>", { desc = "Increase window height" })
vim.keymap.set("n", "<A-j>", ":resize -2<CR>", { desc = "Decrease window height" })
vim.keymap.set("n", "<A-h>", ":vertical resize -2<CR>", { desc = "Decrease window width" })
vim.keymap.set("n", "<A-l>", ":vertical resize +2<CR>", { desc = "Increase window width" })
