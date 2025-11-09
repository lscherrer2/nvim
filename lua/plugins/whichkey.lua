return {
  "folke/which-key.nvim",
  opts = {
    timeout = true,
    timeoutlen = 300,
  },
  config = function(_, opts)
    require("which-key").setup(opts)
  end,
}
