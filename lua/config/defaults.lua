vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.smartindent = true
vim.opt.autoindent = false
vim.opt.smarttab = false


vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- enable 24-bit colour
vim.opt.termguicolors = true

-- Relative Line Numbers
vim.api.nvim_create_autocmd({ "BufEnter", "FocusGained", "InsertLeave" }, {
  callback = function()
    local ft = vim.bo.filetype
    if ft ~= "NvimTree" then
      vim.opt.relativenumber = true
    end
  end,
})

-- Fix python indenting
vim.api.nvim_create_autocmd("FileType", {
  pattern = "python",
  command = "setlocal indentexpr=",
})

-- Add python rulers
vim.api.nvim_create_autocmd("FileType", {
  pattern = "python",
  callback = function()
    vim.opt.colorcolumn = "72,79"
  end,
})


-- Better leader characters
vim.g.mapleader = " "
vim.g.maplocalleader = " "
