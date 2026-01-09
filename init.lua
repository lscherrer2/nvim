-- Set leader keys before loading anything else
vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("config")
require("lang")

vim.cmd.colorscheme("gruvbox-material")
