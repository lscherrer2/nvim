return {
	on_attach = function()
		print("basedpyright attached")
	end,
	settings = {
		python = {
			venvPath = ".",
			venv = ".venv",
		},
	},
}
