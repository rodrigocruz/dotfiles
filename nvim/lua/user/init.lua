require("user/plugins")
require("user/options")
require("user/keymaps")
require("user/whichkey")
require("user/functions")

vim.cmd([[
  augroup FileTypeOverrides
    autocmd!
    autocmd TermOpen * setlocal nospell
  augroup END
]])
