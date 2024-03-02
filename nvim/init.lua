require("user/options")
require("plugins")
require("user/whichkey")
require("user/mappings")

vim.cmd([[
  augroup FileTypeOverrides
    autocmd!
    autocmd TermOpen * setlocal nospell
  augroup END
]])

vim.keymap.set("i","jk","<Esc>")
