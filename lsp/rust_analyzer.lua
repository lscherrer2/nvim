return {
	name = "rust-analyzer",
	cmd = { "rust-analyzer" },
	root_dir = vim.fs.root(0, { "Cargo.toml", ".git" }),
	settings = {
		["rust-analyzer"] = {},
	},
}
