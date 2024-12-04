local wk = require("which-key")

wk.add({
  { "gl", "<Plug>(neorg.esupports.hop.hop-link)", desc = "Goto Link", mode = "n" },
  { "<localleader>tt", "<plug>(neorg.qol.todo-items.todo.task-cycle)", { desc = "toggle todo" }, mode = "n" },

  { "<localleader>t", group = "Neorg Tasks" },
  vim.keymap.set("n", "<localleader>td", "<plug>(neorg.qol.todo-items.todo.task-done)", { desc = "Task done" }),
  vim.keymap.set(
    "n",
    "<localleader>ti",
    "<plug>(neorg.qol.todo-items.todo.task-important)",
    { desc = "Task important" }
  ),
  vim.keymap.set("n", "<localleader>th", "<plug>(neorg.qol.todo-items.todo.task-on-hold)", { desc = "Task on-hold" }),
  vim.keymap.set("n", "<localleader>tp", "<plug>(neorg.qol.todo-items.todo.task-pending)", { desc = "Task pending" }),
  vim.keymap.set("n", "<localleader>tu", "<plug>(neorg.qol.todo-items.todo.task-undone)", { desc = "Task undone" }),
  vim.keymap.set(
    "n",
    "<localleader>tc",
    "<plug>(neorg.qol.todo-items.todo.task-cancelled)",
    { desc = "Task cancelled" }
  ),

  { "<localleader>l", group = "Neorg List" },
  vim.keymap.set("n", "<localleader>lt", "<plug>(neorg.pivot.list.toggle)", { desc = "List Toggle" }),
  vim.keymap.set("n", "<localleader>li", "<plug>(neorg.pivot.list.invert)", { desc = "List Invert" }),

  { "<localleader>o", group = "Neorg" },
  vim.keymap.set("n", "<localleader>oo", "<cmd>Neorg<cr>", { desc = "Menu" }),
  vim.keymap.set("n", "<localleader>oi", "<cmd>Neorg index<cr>", { desc = "Index" }),
  vim.keymap.set("n", "<localleader>or", "<cmd>Neorg return<cr>", { desc = "Neorg Return" }),
})
