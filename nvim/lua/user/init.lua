require("user/options")
require("user/keymaps")
require("user/plugins")
require("user/whichkey")
require("user/functions")
require("user/wk-mappings")

vim.cmd([[
  augroup FileTypeOverrides
    autocmd!
    autocmd TermOpen * setlocal nospell
  augroup END
]])
