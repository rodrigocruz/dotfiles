-- require("config.keymaps.neorg")
-- require("config.keymaps.obsidian")
require("config.keymaps.diffview")
require("config.keymaps.gh")
require("config.keymaps.platformio")
require("config.keymaps.xcode")
-- require("config.keymaps.telekasten")

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
  { desc = "Buffer Diagnostics" }
)
vim.keymap.set("n", "<leader>xX", ":Trouble diagnostics toggle focus=true<cr>", { desc = "Workspace Diagnostics" })
vim.keymap.set("v", "<leader>si", ":BrowserSearch<cr>", { desc = "Search selected word in Web" })

vim.keymap.set("n", "<leader>cvgm", function()
  require("laravel-ide-helper").generate_models(vim.fn.expand("%"))
end, { desc = "Generate Model Info for current model" })

vim.keymap.set("n", "<leader>cvgM", function()
  require("laravel-ide-helper").generate_models()
end, { desc = "Generate Model Info for all models" })

vim.keymap.set("n", "<leader>ci", "<cmd>CccPick<cr>", { desc = "Pick Color" })

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

vim.keymap.set("n", "<c-h>", ":TmuxNavigateLeft<cr>", { desc = "" })
vim.keymap.set("n", "<c-j>", ":TmuxNavigateDown<cr>", { desc = "" })
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

pcall(vim.keymap.del, "n", "L")
pcall(vim.keymap.del, "n", "H")

-- lua/custom/snacks_keymaps.lua
local snacks = require("snacks.picker")

-- Methods / Functions only
vim.keymap.set("n", "<leader>sm", function()
  snacks.lsp_symbols({
    filter = {
      default = { "Method", "Function" },
    },
  })
end, { desc = "Snacks: Methods / Functions only" })

-- Variables / Fields / Properties / Constants only
vim.keymap.set("n", "<leader>sv", function()
  snacks.lsp_symbols({
    filter = {
      default = { "Variable", "Field", "Property", "Constant" },
    },
  })
end, { desc = "Snacks: Variables / Fields / Properties / Constants" })
