return {
	filetypes = { "python" },
	settings = {
		basedpyright = {
			analysis = {
				useLibraryCodeForTypes = true,
				typeCheckingMode = "off",
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
