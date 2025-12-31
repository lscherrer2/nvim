return {
	on_attach = function()
		print("lua_ls attached")
	end,
	settings = {
		Lua = {
			runtime = {
				version = "LuaJIT",
			},
			diagnostics = {
				globals = { "vim" },
			},
			workspace = {
				checkThirdParty = false,
				library = {
					vim.env.VIMRUNTIME,
				},
			},
			completion = {
				callSnippet = "Replace",
			},
		},
	},
}
