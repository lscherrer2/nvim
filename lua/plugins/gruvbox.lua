return {
  "sainnhe/gruvbox-material",
  lazy = false,
  priority = 1000,
  config = function()
    vim.g.gruvbox_material_background = "medium"  -- "medium", "hard", "soft"
    vim.g.gruvbox_material_foreground = "material" -- "material", "mix", "original"
    vim.g.gruvbox_material_enable_bold = 1
    vim.g.gruvbox_material_enable_italic = 1
    vim.o.background = "dark"
    vim.cmd.colorscheme("gruvbox-material")
  end,
}
