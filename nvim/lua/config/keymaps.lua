-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set("i", "jk", "<ESC>", { silent = true })
vim.keymap.set("n", "<leader>wv", "<C-W>v", { desc = "Split Window Right" })
vim.keymap.set("n", "<leader>ws", "<C-W>s", { desc = "Split Window Below" })
vim.keymap.set(
  "n",
  "<leader>xx",
  ":Trouble diagnostics toggle focus=true filter.buf=0<cr>",
  { desc = "Split Window Below" }
)
vim.keymap.set("n", "<leader>xX", ":Trouble diagnostics toggle focus=true<cr>", { desc = "Split Window Below" })
vim.keymap.set("v", "<leader>si", ":BrowserSearch<cr>", { desc = "Search selected word in Web" })
vim.keymap.set("n", "<leader>gn", ":Neogit<cr>", { desc = "Open Neogit" })

vim.keymap.set("n", "<leader>cvgm", function()
  require("laravel-ide-helper").generate_models(vim.fn.expand("%"))
end, { desc = "Generate Model Info for current model" })

vim.keymap.set("n", "<leader>cvgM", function()
  require("laravel-ide-helper").generate_models()
end, { desc = "Generate Model Info for all models" })

vim.keymap.set("n", "<leader>vo", ":DiffviewOpen<cr>", { desc = "Open Diffview" })
vim.keymap.set("n", "<leader>vc", ":DiffviewClose<cr>", { desc = "Close Diffview" })
vim.keymap.set("n", "<leader>vf", ":DiffviewFileHistory --follow %<cr>", { desc = "File History" })
vim.keymap.set("n", "<leader>vh", ":DiffviewFileHistory<cr>", { desc = "Repo history" })
vim.keymap.set("v", "<leader>vl", "<Esc><Cmd>'<,'>DiffviewFileHistory --follow<CR>", { desc = "Range history" })
vim.keymap.set("n", "<leader>vl", "<Cmd>.DiffviewFileHistory --follow<CR>", { desc = "Line history" })
-- Diff against local master branch
vim.keymap.set("n", "<leader>vm", function()
  vim.cmd("DiffviewOpen main")
end, { desc = "Diff against main" })

-- Diff against remote master branch
vim.keymap.set("n", "<leader>vM", function()
  vim.cmd("DiffviewOpen HEAD..origin/main")
end, { desc = "Diff against origin/main" })
--

vim.keymap.set("n", "<leader>aa", ":AvanteChat<cr>", { desc = "Ask AI" })

vim.keymap.set("n", "<leader>I", "<cmd>XcodebuildPicker<cr>", { desc = "Show Xcodebuild Actions" })
vim.keymap.set("n", "<leader>if", "<cmd>XcodebuildProjectManager<cr>", { desc = "Show Project Manager Actions" })

vim.keymap.set("n", "<leader>ib", "<cmd>XcodebuildBuild<cr>", { desc = "Build Project" })
vim.keymap.set("n", "<leader>iB", "<cmd>XcodebuildBuildForTesting<cr>", { desc = "Build For Testing" })
vim.keymap.set("n", "<leader>ir", "<cmd>XcodebuildBuildRun<cr>", { desc = "Build & Run Project" })

vim.keymap.set("n", "<leader>it", "<cmd>XcodebuildTest<cr>", { desc = "Run Tests" })
vim.keymap.set("v", "<leader>it", "<cmd>XcodebuildTestSelected<cr>", { desc = "Run Selected Tests" })
vim.keymap.set("n", "<leader>iT", "<cmd>XcodebuildTestClass<cr>", { desc = "Run Current Test Class" })
vim.keymap.set("n", "<leader>i.", "<cmd>XcodebuildTestRepeat<cr>", { desc = "Repeat Last Test Run" })

vim.keymap.set("n", "<leader>il", "<cmd>XcodebuildToggleLogs<cr>", { desc = "Toggle Xcodebuild Logs" })
vim.keymap.set("n", "<leader>ic", "<cmd>XcodebuildToggleCodeCoverage<cr>", { desc = "Toggle Code Coverage" })
vim.keymap.set("n", "<leader>iC", "<cmd>XcodebuildShowCodeCoverageReport<cr>", { desc = "Show Code Coverage Report" })
vim.keymap.set("n", "<leader>ie", "<cmd>XcodebuildTestExplorerToggle<cr>", { desc = "Toggle Test Explorer" })
vim.keymap.set("n", "<leader>is", "<cmd>XcodebuildFailingSnapshots<cr>", { desc = "Show Failing Snapshots" })

vim.keymap.set("n", "<leader>id", "<cmd>XcodebuildSelectDevice<cr>", { desc = "Select Device" })
vim.keymap.set("n", "<leader>ip", "<cmd>XcodebuildSelectTestPlan<cr>", { desc = "Select Test Plan" })
vim.keymap.set("n", "<leader>iq", "<cmd>Telescope quickfix<cr>", { desc = "Show QuickFix List" })

vim.keymap.set("n", "<leader>ix", "<cmd>XcodebuildQuickfixLine<cr>", { desc = "Quickfix Line" })
vim.keymap.set("n", "<leader>xa", "<cmd>XcodebuildCodeActions<cr>", { desc = "Show Code Actions" })

vim.keymap.set("n", "<leader>cg", "<cmd>Octo actions<cr>", { desc = "github actions" })

vim.keymap.set("n", "<leader>bs", "<cmd>Scratch<cr>", { desc = "Scratch buffer" })

vim.keymap.set("n", "<leader>on", "<cmd>ObsidianNewFromTemplate<cr>", { desc = "New Obsidian Note from Template" })
vim.keymap.set("n", "<leader>oN", "<cmd>ObsidianNew<cr>", { desc = "New Obsidian Note" })
vim.keymap.set("n", "<leader>oo", "<cmd>ObsidianQuickSwitch<cr>", { desc = "Switch" })
vim.keymap.set("n", "<leader>os", "<cmd>ObsidianSearch<cr>", { desc = "Search" })
vim.keymap.set("n", "<leader>ob", "<cmd>ObsidianBacklinks<cr>", { desc = "Backlinks" })
vim.keymap.set("n", "<leader>od", "<cmd>ObsidianDailies<cr>", { desc = "Dailies" })
vim.keymap.set("n", "<leader>ol", "<cmd>ObsidianLinks<cr>", { desc = "Links" })
vim.keymap.set("n", "<leader>ot", "<cmd>ObsidianTOC<cr>", { desc = "TOC" })
vim.keymap.set("n", "<leader>oa", "<cmd>ObsidianTags<cr>", { desc = "Tags" })
