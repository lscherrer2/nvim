return {
	on_attach = function()
		print("clangd attached")
	end,
	filetypes = { "c", "cpp" },
	root_markers = {
		"compile_commands.json",
		"compile_flags.txt",
		".clangd",
		".clang-format",
		".git",
	},
}
