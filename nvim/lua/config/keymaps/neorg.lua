local wk = require("which-key")

wk.add({
  { "<leader>o", group = "Neorg" },
  vim.keymap.set("n", "<leader>oo", "<cmd>Neorg<cr>", { desc = "Menu" }),
  vim.keymap.set("n", "<leader>oi", "<cmd>Neorg index<cr>", { desc = "Index" }),
  vim.keymap.set("n", "<leader>or", "<cmd>Neorg return<cr>", { desc = "Neorg Return" }),
})
