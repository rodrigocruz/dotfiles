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

vim.keymap.set("n", "<leader>I", "<cmd>XcodebuildPicker<cr>", { desc = "Show Xcodebuild Actions" })

wk.add({
  { "<leader>i", group = "iOS/Xcode" },
  { "<leader>if", "<cmd>XcodebuildProjectManager<cr>", desc = "Show Project Manager Actions" },
  { "<leader>ib", "<cmd>XcodebuildBuild<cr>", { desc = "Build Project" } },
  { "<leader>iB", "<cmd>XcodebuildBuildForTesting<cr>", { desc = "Build For Testing" } },
  { "<leader>ir", "<cmd>XcodebuildBuildRun<cr>", { desc = "Build & Run Project" } },
  { "<leader>it", "<cmd>XcodebuildTest<cr>", { desc = "Run Tests" } },
  { "<leader>it", "<cmd>XcodebuildTestSelected<cr>", { desc = "Run Selected Tests" } },
  { "<leader>iT", "<cmd>XcodebuildTestClass<cr>", { desc = "Run Current Test Class" } },
  { "<leader>i.", "<cmd>XcodebuildTestRepeat<cr>", { desc = "Repeat Last Test Run" } },
  { "<leader>il", "<cmd>XcodebuildToggleLogs<cr>", { desc = "Toggle Xcodebuild Logs" } },
  { "<leader>ic", "<cmd>XcodebuildToggleCodeCoverage<cr>", { desc = "Toggle Code Coverage" } },
  { "<leader>iC", "<cmd>XcodebuildShowCodeCoverageReport<cr>", { desc = "Show Code Coverage Report" } },
  { "<leader>ie", "<cmd>XcodebuildTestExplorerToggle<cr>", { desc = "Toggle Test Explorer" } },
  { "<leader>is", "<cmd>XcodebuildFailingSnapshots<cr>", { desc = "Show Failing Snapshots" } },
  { "<leader>id", "<cmd>XcodebuildSelectDevice<cr>", { desc = "Select Device" } },
  { "<leader>ip", "<cmd>XcodebuildSelectTestPlan<cr>", { desc = "Select Test Plan" } },
  { "<leader>iq", "<cmd>Telescope quickfix<cr>", { desc = "Show QuickFix List" } },
  { "<leader>ix", "<cmd>XcodebuildQuickfixLine<cr>", { desc = "Quickfix Line" } },
  { "<leader>iS", "<cmd>XcodebuildSetup<cr>", { desc = "Initial Setup" } },
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

-- vim.keymap.set("n", "<leader>Ac", ":ArduinoVerify<CR>", { desc = "Arduino: Verify/Compile" })
-- vim.keymap.set("n", "<leader>Au", ":ArduinoUpload<CR>", { desc = "Arduino: Upload" })
-- vim.keymap.set("n", "<leader>As", ":ArduinoSerial<CR>", { desc = "Arduino: Serial Monitor" })
-- vim.keymap.set("n", "<leader>Ab", ":ArduinoChooseBoard<CR>", { desc = "Arduino: Choose Board" })
-- vim.keymap.set("n", "<leader>Ap", ":ArduinoChoosePort<CR>", { desc = "Arduino: Choose Port" })
-- vim.keymap.set("n", "<leader>Ad", ":ArduinoUploadAndSerial<CR>", { desc = "Arduino: Upload & Serial" })

vim.keymap.set("n", "<leader>Pb", ":Piocmdf run<CR>", { desc = "PlatformIO: Build" })
vim.keymap.set("n", "<leader>Pu", ":Piocmdf run -t upload<CR>", { desc = "PlatformIO: Upload" })
vim.keymap.set("n", "<leader>Pc", ":Piocmdf run -t clean<CR>", { desc = "PlatformIO: Clean" })
vim.keymap.set("n", "<leader>Pf", ":Piocmdf run -t fullclean<CR>", { desc = "PlatformIO: Full Clean" })
vim.keymap.set("n", "<leader>Ps", ":Piocmdh run -t monitor<CR>", { desc = "PlatformIO: Serial Monitor" })
vim.keymap.set("n", "<leader>Pd", ":Piocmdf device list<CR>", { desc = "PlatformIO: Device List" })
vim.keymap.set("n", "<leader>PB", ":Piocmdf run -t buildfs<CR>", { desc = "PlatformIO: Build File System" })
vim.keymap.set("n", "<leader>PU", ":Piocmdf run -t uploadfs<CR>", { desc = "PlatformIO: Upload File System" })
vim.keymap.set("n", "<leader>PE", ":Piocmdf run -t erase<CR>", { desc = "PlatformIO: Erase Flash" })
vim.keymap.set("n", "<leader>PL", ":Piocmdf pkg list<CR>", { desc = "PlatformIO: List Packages" })
vim.keymap.set("n", "<leader>PO", ":Piocmdf pkg outdated<CR>", { desc = "PlatformIO: Outdated Packages" })
vim.keymap.set("n", "<leader>PP", ":Piocmdf pkg update<CR>", { desc = "PlatformIO: Update Packages" })
vim.keymap.set("n", "<leader>Pt", ":Piocmdf test<CR>", { desc = "PlatformIO: Test" })
vim.keymap.set("n", "<leader>PC", ":Piocmdf check<CR>", { desc = "PlatformIO: Check" })
vim.keymap.set("n", "<leader>PD", ":Piocmdf debug<CR>", { desc = "PlatformIO: Debug" })
vim.keymap.set("n", "<leader>PvB", ":Piocmdf run -v<CR>", { desc = "PlatformIO: Verbose Build" })
vim.keymap.set("n", "<leader>PvU", ":Piocmdf run -v -t upload<CR>", { desc = "PlatformIO: Verbose Upload" })
vim.keymap.set("n", "<leader>PvT", ":Piocmdf test -v<CR>", { desc = "PlatformIO: Verbose Test" })
vim.keymap.set("n", "<leader>PvC", ":Piocmdf check -v<CR>", { desc = "PlatformIO: Verbose Check" })
vim.keymap.set("n", "<leader>PvD", ":Piocmdf debug -v<CR>", { desc = "PlatformIO: Verbose Debug" })
vim.keymap.set("n", "<leader>PUg", ":Piocmdf upgrade<CR>", { desc = "PlatformIO: Upgrade Core" })

vim.keymap.set("n", "<c-h>", ":TmuxNavigateLeft<cr>", { desc = "" })
vim.keymap.set("n", "<c-k>", ":TmuxNavigateDown<cr>", { desc = "" })
vim.keymap.set("n", "<c-k>", ":TmuxNavigateUp<cr>", { desc = "" })
vim.keymap.set("n", "<c-l>", ":TmuxNavigateRight<cr>", { desc = "" })

vim.keymap.set("n", "<leader>Of", function()
  vim.fn.jobstart({ "open", vim.fn.expand("%:p:h") })
end, { desc = "Open containing folder in Finder" })
