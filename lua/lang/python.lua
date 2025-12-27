vim.api.nvim_create_autocmd("FileType", {
	pattern = "python",
	command = "setlocal indentexpr=",
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = "python",
	callback = function()
		vim.opt.colorcolumn = "72,79"
	end,
})
