vim.keymap.set("n", "<leader>qq", vim.diagnostic.setqflist)
vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(ev)
		local opts = { buffer = ev.buf, silent = true }

		local map = function(mode, lhs, rhs)
			vim.keymap.set(mode, lhs, rhs, opts)
		end

		map("n", "gd", vim.lsp.buf.definition)
		map("n", "gD", vim.lsp.buf.declaration)

		map("n", "K", vim.lsp.buf.hover)
		map("n", "gl", vim.diagnostic.open_float)
		map("n", "gr", vim.lsp.buf.references)
		map("n", "gi", vim.lsp.buf.implementation)

		map("n", "gr", vim.lsp.buf.rename)
		map("n", "[d", function()
			vim.diagnostic.jump({ count = 1, float = true })
		end)
		map("n", "]d", function()
			vim.diagnostic.jump({ count = -1, float = true })
		end)
	end,
})
