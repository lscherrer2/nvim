vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.smartindent = true
vim.opt.autoindent = false
vim.opt.smarttab = false

-- Optional: make it local per filetype later via ftplugin/
-- Example: 2-space indent for JS/TS
-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = { "javascript", "typescript", "json" },
--   callback = function()
--     vim.opt_local.shiftwidth = 2
--     vim.opt_local.tabstop = 2
--     vim.opt_local.softtabstop = 2
--   end,
-- })

-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- optionally enable 24-bit colour
vim.opt.termguicolors = true

-- Relative Line Numbers
vim.api.nvim_create_autocmd({ "BufEnter", "FocusGained", "InsertLeave" }, {
  pattern = "*",
  command = "set relativenumber",
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

-- Trim trailing whitespace
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function()
    local pos = vim.api.nvim_win_get_cursor(0)
    vim.cmd([[
      keepjumps keeppatterns silent! %s/\s\+$//e
    ]])
    vim.api.nvim_win_set_cursor(0, pos)
  end,
})




