return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      filesystem = {
        filtered_items = {
          visible = true, 
          hide_dotfiles = false, 
          hide_gitignored = false, 
          hide_by_name = {
            "__pycache__",
          },
          hide_by_pattern = {
	          "*.egg-info",
          }
        },
      },
    },
  }
}
