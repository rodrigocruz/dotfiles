local wk = require("which-key")

wk.add({
  { "<leader>gH", group = "Github" },
  { "<leader>gHc", group = "Commits" },
  { "<leader>gHi", group = "Issues" },
  { "<leader>gHl", group = "Litee" },
  { "<leader>gHp", group = "Pull Request" },
  { "<leader>gHr", group = "Review" },
  { "<leader>gHt", group = "Threads" },
})

vim.keymap.set("n", "<leader>gHcc", "<cmd>GHCloseCommit<cr>", { desc = "Close" })
vim.keymap.set("n", "<leader>gHce", "<cmd>GHExpandCommit<cr>", { desc = "Expand" })
vim.keymap.set("n", "<leader>gHco", "<cmd>GHOpenToCommit<cr>", { desc = "Open To" })
vim.keymap.set("n", "<leader>gHcp", "<cmd>GHPopOutCommit<cr>", { desc = "Pop Out" })
vim.keymap.set("n", "<leader>gHcz", "<cmd>GHCollapseCommit<cr>", { desc = "Collapse" })

vim.keymap.set("n", "<leader>gHip", "<cmd>GHPreviewIssue<cr>", { desc = "Preview" })

vim.keymap.set("n", "<leader>gHlt", "<cmd>LTPanel<cr>", { desc = "Toggle Panel" })

vim.keymap.set("n", "<leader>gHpc", "<cmd>GHClosePR<cr>", { desc = "Close" })
vim.keymap.set("n", "<leader>gHpd", "<cmd>GHPRDetails<cr>", { desc = "Details" })
vim.keymap.set("n", "<leader>gHpe", "<cmd>GHExpandPR<cr>", { desc = "Expand" })
vim.keymap.set("n", "<leader>gHpo", "<cmd>GHOpenPR<cr>", { desc = "Open" })
vim.keymap.set("n", "<leader>gHpp", "<cmd>GHPopOutPR<cr>", { desc = "PopOut" })
vim.keymap.set("n", "<leader>gHpr", "<cmd>GHRefreshPR<cr>", { desc = "Refresh" })
vim.keymap.set("n", "<leader>gHpt", "<cmd>GHOpenToPR<cr>", { desc = "Open To" })
vim.keymap.set("n", "<leader>gHpz", "<cmd>GHCollapsePR<cr>", { desc = "Collapse" })

vim.keymap.set("n", "<leader>gHrb", "<cmd>GHStartReview<cr>", { desc = "Begin" })
vim.keymap.set("n", "<leader>gHrc", "<cmd>GHCloseReview<cr>", { desc = "Close" })
vim.keymap.set("n", "<leader>gHrd", "<cmd>GHDeleteReview<cr>", { desc = "Delete" })
vim.keymap.set("n", "<leader>gHre", "<cmd>GHExpandReview<cr>", { desc = "Expand" })
vim.keymap.set("n", "<leader>gHrs", "<cmd>GHSubmitReview<cr>", { desc = "Submit" })
vim.keymap.set("n", "<leader>gHrz", "<cmd>GHCollapseReview<cr>", { desc = "Collapse" })

vim.keymap.set("n", "<leader>gHtc", "<cmd>GHCreateThread<cr>", { desc = "Create" })
vim.keymap.set("n", "<leader>gHtn", "<cmd>GHNextThread<cr>", { desc = "Next" })
vim.keymap.set("n", "<leader>gHtt", "<cmd>GHToggleThread<cr>", { desc = "Toggle" })
