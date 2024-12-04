-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.g.lazyvim_php_lsp = "intelephense"
vim.g.maplocalleader = ","

local opt = vim.opt

opt.number = false
opt.relativenumber = false
opt.shiftwidth = 4
opt.tabstop = 4
