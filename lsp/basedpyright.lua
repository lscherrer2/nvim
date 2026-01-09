return {
    settings = {
        basedpyright = {
            analysis = {
                -- Modes: "off", "basic", "standard", "strict", "recommended", "all"
                typeCheckingMode = "off",
                autoSearchPaths = true,
                useLibraryCodeForTypes = true,
                diagnosticMode = "openFilesOnly",
            },
        },
        python = {
            venvPath = ".",
            venv = ".venv",
        },
    },
}
