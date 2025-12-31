return {
	{
		"neovim/nvim-lspconfig",
	},
	{
		"hrsh7th/cmp-nvim-lsp",
		opts = {},
		config = function(_, opts)
			local cmp_lsp = require("cmp_nvim_lsp")
			cmp_lsp.setup(opts)
			local capabilities = cmp_lsp.default_capabilities()
			vim.lsp.config("*", { capabilities = capabilities })
		end,
	},
}
