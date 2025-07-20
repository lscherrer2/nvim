return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      filesystem = {
        filtered_items = {
          visible = false, 
          hide_dotfiles = false, 
          hide_gitignored = false, 
          hide_by_name = {
            "__pycache__",
          },
          hide_by_pattern = {
	          "*.egg-info",
          },
        },
      },
    },
  }
}
