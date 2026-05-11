local wk = require("which-key")

wk.add({ { "<leader>v", group = "DiffView" } })

vim.keymap.set("n", "<leader>vo", "<cmd>DiffviewOpen<cr>", { desc = "Open Diffview" })
vim.keymap.set("n", "<leader>vc", "<cmd>DiffviewClose<cr>", { desc = "Close Diffview" })
vim.keymap.set("n", "<leader>vf", "<cmd>DiffviewFileHistory --follow %<cr>", { desc = "File History" })
vim.keymap.set("n", "<leader>vh", "<cmd>DiffviewFileHistory<cr>", { desc = "Repo history" })
vim.keymap.set("n", "<leader>vl", "<cmd>.DiffviewFileHistory --follow<cr>", { desc = "Line history" })
vim.keymap.set("v", "<leader>vl", "<Esc><cmd>'<,'>DiffviewFileHistory --follow<cr>", { desc = "Range history" })
vim.keymap.set("n", "<leader>vm", "<cmd>DiffviewOpen main<cr>", { desc = "Diff against main" })
vim.keymap.set("n", "<leader>vM", "<cmd>DiffviewOpen HEAD..origin/main<cr>", { desc = "Diff against origin/main" })
