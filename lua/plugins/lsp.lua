return {
	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"saadparwaiz1/cmp_luasnip",
			"hrsh7th/cmp-path",
			-- "hrsh7th/cmp-buffer",
		},
		config = function()
			local cmp = require("cmp")
			local cmp_next = function(fallback)
				if cmp.visible() then
					cmp.select_next_item()
				else
					fallback()
				end
			end
			local cmp_prev = function(fallback)
				if cmp.visible() then
					cmp.select_prev_item()
				else
					fallback()
				end
			end
			local cmp_close = function(fallback)
				if cmp.visible() then
					cmp.close()
				else
					fallback()
				end
			end
			cmp.setup({
				mapping = cmp.mapping.preset.insert({
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-Space>"] = cmp.mapping.complete(),
					["<CR>"] = cmp.mapping.confirm({ select = true }),
					["<Tab>"] = cmp.mapping(cmp_next, { "i", "s" }),
					["<S-Tab>"] = cmp.mapping(cmp_prev, { "i", "s" }),
					["<C-j>"] = cmp.mapping(cmp_next, { "i", "s" }),
					["<C-k>"] = cmp.mapping(cmp_prev, { "i", "s" }),
					["<Esc>"] = cmp.mapping(cmp_close, { "i", "s" }),
				}),
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "path" },
					-- { name = "buffer" },
				}),
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = { "hrsh7th/cmp-nvim-lsp", "hrsh7th/nvim-cmp" },
		config = function()
			local lspconfig = require("lspconfig")
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			lspconfig.util.default_config.capabilities = capabilities
		end,
	},
}
