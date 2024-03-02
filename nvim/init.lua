require("user/options")
require("mappings")
require("plugins")
require("whichkey")
require("wk-mappings")

vim.cmd([[
  augroup FileTypeOverrides
    autocmd!
    autocmd TermOpen * setlocal nospell
  augroup END
]])

vim.keymap.set("i","jk","<Esc>")
