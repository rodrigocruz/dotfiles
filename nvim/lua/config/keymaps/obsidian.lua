local wk = require("which-key")

wk.add({
  { "<leader>o", group = "Obsidian" },
  vim.keymap.set("n", "<leader>oo", "<cmd>Obsidian quick_switch<cr>", { desc = "Quick Switch" }),
  vim.keymap.set("n", "<leader>os", "<cmd>Obsidian search<cr>", { desc = "Search" }),
  vim.keymap.set("n", "<leader>ow", "<cmd>Obsidian workspace<cr>", { desc = "Change workspace" }),
  vim.keymap.set("n", "<leader>on", "<cmd>Obsidian new<cr>", { desc = "New note" }),
  vim.keymap.set("n", "<leader>ot", "<cmd>Obsidian tags<cr>", { desc = "Tags" }),
})
