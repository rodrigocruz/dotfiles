require("config.keymaps.neorg")

local wk = require("which-key")

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

vim.keymap.set("n", "<leader>cvgm", function()
  require("laravel-ide-helper").generate_models(vim.fn.expand("%"))
end, { desc = "Generate Model Info for current model" })

vim.keymap.set("n", "<leader>cvgM", function()
  require("laravel-ide-helper").generate_models()
end, { desc = "Generate Model Info for all models" })

wk.add({
  { "<leader>v", group = "DiffView" },
  { "<leader>vo", ":DiffviewOpen<cr>", desc = "Open Diffview" },
  { "<leader>vc", ":DiffviewClose<cr>", desc = "Close Diffview" },
  { "<leader>vf", ":DiffviewFileHistory --follow %<cr>", desc = "File History" },
  { "<leader>vh", ":DiffviewFileHistory<cr>", desc = "Repo history" },
  { "<leader>vl", "<Esc><Cmd>'<,'>DiffviewFileHistory --follow<CR>", desc = "Range history" },
  { "<leader>vl", "<Cmd>.DiffviewFileHistory --follow<CR>", desc = "Line history" },
  {
    "<leader>vm",
    function()
      vim.cmd("DiffviewOpen main")
    end,
    desc = "Diff against main",
  },
  {
    "<leader>vM",
    function()
      vim.cmd("DiffviewOpen HEAD..origin/main")
    end,
    desc = "Diff against origin/main",
  },
})

vim.keymap.set("n", "<leader>I", "<cmd>XcodebuildPicker<cr>", { desc = "Show Xcodebuild Actions" })

wk.add({
  { "<leader>i", group = "iOS/Xcode" },
  { "<leader>if", "<cmd>XcodebuildProjectManager<cr>", desc = "Show Project Manager Actions" },
  { "<leader>ib", "<cmd>XcodebuildBuild<cr>", desc = "Build Project" },
  { "<leader>iB", "<cmd>XcodebuildBuildForTesting<cr>", desc = "Build For Testing" },
  { "<leader>ir", "<cmd>XcodebuildBuildRun<cr>", desc = "Build & Run Project" },
  { "<leader>it", "<cmd>XcodebuildTest<cr>", desc = "Run Tests" },
  { "<leader>it", "<cmd>XcodebuildTestSelected<cr>", desc = "Run Selected Tests" },
  { "<leader>iT", "<cmd>XcodebuildTestClass<cr>", desc = "Run Current Test Class" },
  { "<leader>i.", "<cmd>XcodebuildTestRepeat<cr>", desc = "Repeat Last Test Run" },
  { "<leader>il", "<cmd>XcodebuildToggleLogs<cr>", desc = "Toggle Xcodebuild Logs" },
  { "<leader>ic", "<cmd>XcodebuildToggleCodeCoverage<cr>", desc = "Toggle Code Coverage" },
  { "<leader>iC", "<cmd>XcodebuildShowCodeCoverageReport<cr>", desc = "Show Code Coverage Report" },
  { "<leader>ie", "<cmd>XcodebuildTestExplorerToggle<cr>", desc = "Toggle Test Explorer" },
  { "<leader>is", "<cmd>XcodebuildFailingSnapshots<cr>", desc = "Show Failing Snapshots" },
  { "<leader>id", "<cmd>XcodebuildSelectDevice<cr>", desc = "Select Device" },
  { "<leader>ip", "<cmd>XcodebuildSelectTestPlan<cr>", desc = "Select Test Plan" },
  { "<leader>iq", "<cmd>Telescope quickfix<cr>", desc = "Show QuickFix List" },
  { "<leader>ix", "<cmd>XcodebuildQuickfixLine<cr>", desc = "Quickfix Line" },
  { "<leader>iS", "<cmd>XcodebuildSetup<cr>", desc = "Initial Setup" },
})

vim.keymap.set("n", "<leader>xa", "<cmd>XcodebuildCodeActions<cr>", { desc = "Show Code Actions" })

vim.keymap.set("n", "<leader>ci", "<cmd>CccPick<cr>", { desc = "Pick Color" })

-- For default preset
vim.keymap.set("n", "<leader>j", require("treesj").toggle, { desc = "Toggle line join" })
-- For extending default preset with `recursive = true`
vim.keymap.set("n", "<leader>J", function()
  require("treesj").toggle({ split = { recursive = true } })
end, { desc = "Toggle line join recursively" })

-- vim.keymap.set("n", "<leader>ud", require("dbee").toggle, { desc = "Toggle DBEE" })
vim.keymap.set("n", "<leader>;", "<cmd>CommaOrSemiColon<cr>", { desc = "Toggle Comma or Semicolon" })
vim.keymap.set("n", "<Leader>xk", function()
  require("zendiagram").open()
end, { silent = true, desc = "Open diagnostics float" })

-- vim.keymap.set("i", "<C-s>", function()
vim.keymap.set("i", "<C-s>", function()
  local ls = require("luasnip")
  local fzf_lua = require("fzf-lua")

  -- Collect snippet triggers for the current filetype
  local snippets = ls.get_snippets(vim.bo.filetype) or {}
  local available = vim.tbl_map(function(snippet)
    return snippet.trigger
  end, snippets)

  if #available == 0 then
    vim.notify("No snippets available", vim.log.levels.INFO)
    return
  end

  fzf_lua.fzf_exec(available, {
    prompt = "Snippets> ",
    actions = {
      ["default"] = function(selected)
        local selected_trigger = selected[1]
        if not selected_trigger then
          return
        end

        -- Find and expand the selected snippet
        for _, snippet in ipairs(snippets) do
          if snippet.trigger == selected_trigger then
            local success, err = pcall(ls.snip_expand, snippet)
            if not success then
              vim.notify("Error expanding snippet: " .. err, vim.log.levels.ERROR)
            end
            return
          end
        end

        vim.notify("Snippet not found: " .. selected_trigger, vim.log.levels.WARN)
      end,
    },
  })
end, { silent = true, noremap = true, desc = "Show and expand LuaSnip snippets" })

vim.keymap.set("n", "<leader><space>", function()
  Snacks.picker.smart({ multi = { "files" } })
end, { desc = "Find Files (Root Dir)" })

wk.add({
  { "<leader>P", group = "Platformio" },
  { "<leader>Pb", ":Piocmdf run<CR>", { desc = "PlatformIO: Build" } },
  { "<leader>Pu", ":Piocmdf run -t upload<CR>", desc = "PlatformIO: Upload" },
  { "<leader>Pc", ":Piocmdf run -t clean<CR>", desc = "PlatformIO: Clean" },
  { "<leader>Pf", ":Piocmdf run -t fullclean<CR>", desc = "PlatformIO: Full Clean" },
  { "<leader>Ps", ":Piocmdh run -t monitor<CR>", desc = "PlatformIO: Serial Monitor" },
  { "<leader>Pd", ":Piocmdf device list<CR>", desc = "PlatformIO: Device List" },
  { "<leader>PB", ":Piocmdf run -t buildfs<CR>", desc = "PlatformIO: Build File System" },
  { "<leader>PU", ":Piocmdf run -t uploadfs<CR>", desc = "PlatformIO: Upload File System" },
  { "<leader>PE", ":Piocmdf run -t erase<CR>", desc = "PlatformIO: Erase Flash" },
  { "<leader>PL", ":Piocmdf pkg list<CR>", desc = "PlatformIO: List Packages" },
  { "<leader>PO", ":Piocmdf pkg outdated<CR>", desc = "PlatformIO: Outdated Packages" },
  { "<leader>PP", ":Piocmdf pkg update<CR>", desc = "PlatformIO: Update Packages" },
  { "<leader>Pt", ":Piocmdf test<CR>", desc = "PlatformIO: Test" },
  { "<leader>PC", ":Piocmdf check<CR>", desc = "PlatformIO: Check" },
  { "<leader>PD", ":Piocmdf debug<CR>", desc = "PlatformIO: Debug" },
  { "<leader>PUg", ":Piocmdf upgrade<CR>", desc = "PlatformIO: Upgrade Core" },
})

wk.add({
  { "<leader>Pv", group = "Verbose" },
  { "<leader>PvB", ":Piocmdf run -v<CR>", desc = "PlatformIO: Verbose Build" },
  { "<leader>PvU", ":Piocmdf run -v -t upload<CR>", desc = "PlatformIO: Verbose Upload" },
  { "<leader>PvT", ":Piocmdf test -v<CR>", desc = "PlatformIO: Verbose Test" },
  { "<leader>PvC", ":Piocmdf check -v<CR>", desc = "PlatformIO: Verbose Check" },
  { "<leader>PvD", ":Piocmdf debug -v<CR>", desc = "PlatformIO: Verbose Debug" },
})

vim.keymap.set("n", "<c-h>", ":TmuxNavigateLeft<cr>", { desc = "" })
vim.keymap.set("n", "<c-k>", ":TmuxNavigateDown<cr>", { desc = "" })
vim.keymap.set("n", "<c-k>", ":TmuxNavigateUp<cr>", { desc = "" })
vim.keymap.set("n", "<c-l>", ":TmuxNavigateRight<cr>", { desc = "" })

wk.add({
  { "<leader>O", group = "Open in" },
  {
    "<leader>Of",
    function()
      vim.fn.jobstart({ "open", vim.fn.expand("%:p:h") })
    end,
    desc = "Open containing folder in Finder",
  },
})

-- function to center cursor horizontally
local function center_horizontally()
  -- window width (columns)
  local winw = vim.api.nvim_win_get_width(0)
  if winw == nil or winw <= 0 then
    return
  end

  -- cursor virtual column (1-based)
  local vc = vim.fn.virtcol(".")

  -- compute leftcol so cursor lands about in the middle
  -- winsaveview().leftcol is 0-based, virtcol is 1-based -> subtract 1
  local leftcol = vc - math.floor(winw / 2) - 1
  if leftcol < 0 then
    leftcol = 0
  end

  -- save view, set leftcol, restore view (this makes the scroll happen)
  local view = vim.fn.winsaveview()
  view.leftcol = leftcol
  vim.fn.winrestview(view)
end

wk.add({
  { "zh", center_horizontally, desc = "Center cursor horizontally" },
})

-- put cursor at the left edge of the screen
local function center_left()
  -- save current view
  local view = vim.fn.winsaveview()
  -- virtcol('.') is 1-based, leftcol is 0-based
  view.leftcol = vim.fn.virtcol(".") - 1
  if view.leftcol < 0 then
    view.leftcol = 0
  end
  vim.fn.winrestview(view)
end

wk.add({
  { "zl", center_left, desc = "Center cursor left" },
})
