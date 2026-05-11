local wk = require("which-key")

wk.add({ { "<leader>i", group = "iOS/Xcode" } })

vim.keymap.set("n", "<leader>I", "<cmd>XcodebuildPicker<cr>", { desc = "Show Xcodebuild Actions" })
vim.keymap.set("n", "<leader>xa", "<cmd>XcodebuildCodeActions<cr>", { desc = "Show Code Actions" })

vim.keymap.set("n", "<leader>if", "<cmd>XcodebuildProjectManager<cr>", { desc = "Show Project Manager Actions" })
vim.keymap.set("n", "<leader>ib", "<cmd>XcodebuildBuild<cr>", { desc = "Build Project" })
vim.keymap.set("n", "<leader>iB", "<cmd>XcodebuildBuildForTesting<cr>", { desc = "Build For Testing" })
vim.keymap.set("n", "<leader>ir", "<cmd>XcodebuildBuildRun<cr>", { desc = "Build & Run Project" })
vim.keymap.set("n", "<leader>it", "<cmd>XcodebuildTest<cr>", { desc = "Run Tests" })
vim.keymap.set("n", "<leader>is", "<cmd>XcodebuildTestSelected<cr>", { desc = "Run Selected Tests" })
vim.keymap.set("n", "<leader>iT", "<cmd>XcodebuildTestClass<cr>", { desc = "Run Current Test Class" })
vim.keymap.set("n", "<leader>i.", "<cmd>XcodebuildTestRepeat<cr>", { desc = "Repeat Last Test Run" })
vim.keymap.set("n", "<leader>il", "<cmd>XcodebuildToggleLogs<cr>", { desc = "Toggle Xcodebuild Logs" })
vim.keymap.set("n", "<leader>ic", "<cmd>XcodebuildToggleCodeCoverage<cr>", { desc = "Toggle Code Coverage" })
vim.keymap.set("n", "<leader>iC", "<cmd>XcodebuildShowCodeCoverageReport<cr>", { desc = "Show Code Coverage Report" })
vim.keymap.set("n", "<leader>ie", "<cmd>XcodebuildTestExplorerToggle<cr>", { desc = "Toggle Test Explorer" })
vim.keymap.set("n", "<leader>iF", "<cmd>XcodebuildFailingSnapshots<cr>", { desc = "Show Failing Snapshots" })
vim.keymap.set("n", "<leader>id", "<cmd>XcodebuildSelectDevice<cr>", { desc = "Select Device" })
vim.keymap.set("n", "<leader>ip", "<cmd>XcodebuildSelectTestPlan<cr>", { desc = "Select Test Plan" })
vim.keymap.set("n", "<leader>iq", "<cmd>Telescope quickfix<cr>", { desc = "Show QuickFix List" })
vim.keymap.set("n", "<leader>ix", "<cmd>XcodebuildQuickfixLine<cr>", { desc = "Quickfix Line" })
vim.keymap.set("n", "<leader>iS", "<cmd>XcodebuildSetup<cr>", { desc = "Initial Setup" })
vim.keymap.set("n", "<leader>ia", function()
  if vim.env.TMUX then
    vim.fn.system([[tmux new-window -n "skip-emulator" "skip android emulator launch"]])
  else
    vim.notify("Not inside tmux", vim.log.levels.WARN)
  end
end, { desc = "Skip: Android emulator launch (tmux window)" })
