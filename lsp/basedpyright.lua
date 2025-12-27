return {
	filetypes = { "python" },
	settings = {
		basedpyright = {
			analysis = {
				useLibraryCodeForTypes = true,
				typeCheckingMode = "basic",
				diagnosticMode = "workspace",
				autoSearchPath = true,
				inlayHints = {
					callArgumentNames = true,
				},
			},
			python = {
				venvPath = ".",
				venv = ".venv",
			},
		},
	},
}
