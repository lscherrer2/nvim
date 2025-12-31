return {
	on_attach = function()
		vim.lsp.inlay_hint.enable(true)
	end,
	settings = {
		["rust-analyzer"] = {
			check = { command = "clippy" },
		},
	},
}
