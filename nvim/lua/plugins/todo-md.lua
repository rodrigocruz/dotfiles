return {
  "bngarren/checkmate.nvim",
  ft = "markdown", -- Lazy loads for Markdown files matching patterns in 'files'
  opts = {
    files = { "*.md" }, -- any .md file (instead of defaults)
    -- files = {
    --   "~/notes/", -- 'todo.md' anywhere in directory tree
    -- },
    -- Default keymappings
    keys = {
      ["<localleader>t"] = {
        rhs = "<cmd>Checkmate toggle<CR>",
        desc = "Toggle todo item",
        modes = { "n", "v" },
      },
      ["<localleader>c"] = {
        rhs = "<cmd>Checkmate check<CR>",
        desc = "Set todo item as checked (done)",
        modes = { "n", "v" },
      },
      ["<localleader>u"] = {
        rhs = "<cmd>Checkmate uncheck<CR>",
        desc = "Set todo item as unchecked (not done)",
        modes = { "n", "v" },
      },
      ["<localleader>="] = {
        rhs = "<cmd>Checkmate cycle_next<CR>",
        desc = "Cycle todo item(s) to the next state",
        modes = { "n", "v" },
      },
      ["<localleader>-"] = {
        rhs = "<cmd>Checkmate cycle_previous<CR>",
        desc = "Cycle todo item(s) to the previous state",
        modes = { "n", "v" },
      },
      ["<localleader>n"] = {
        rhs = "<cmd>Checkmate create<CR>",
        desc = "Create todo item",
        modes = { "n", "v" },
      },
      ["<localleader>r"] = {
        rhs = "<cmd>Checkmate remove<CR>",
        desc = "Remove todo marker (convert to text)",
        modes = { "n", "v" },
      },
      ["<localleader>R"] = {
        rhs = "<cmd>Checkmate remove_all_metadata<CR>",
        desc = "Remove all metadata from a todo item",
        modes = { "n", "v" },
      },
      ["<localleader>a"] = {
        rhs = "<cmd>Checkmate archive<CR>",
        desc = "Archive checked/completed todo items (move to bottom section)",
        modes = { "n" },
      },
      ["<localleader>F"] = {
        rhs = "<cmd>Checkmate select_todo<CR>",
        desc = "Open a picker to select a todo from the current buffer",
        modes = { "n" },
      },
      ["<localleader>v"] = {
        rhs = "<cmd>Checkmate toggle important<CR>",
        desc = "Update the value of a metadata tag under the cursor",
        modes = { "n" },
      },
      ["<localleader>]"] = {
        rhs = "<cmd>Checkmate metadata jump_next<CR>",
        desc = "Move cursor to next metadata tag",
        modes = { "n" },
      },
      ["<localleader>["] = {
        rhs = "<cmd>Checkmate metadata jump_previous<CR>",
        desc = "Move cursor to previous metadata tag",
        modes = { "n" },
      },
      ["<localleader>i"] = {
        rhs = function()
          require("checkmate").toggle("important")
        end,
        desc = "",
        modes = { "n" },
      },
      ["<localleader>h"] = {
        rhs = function()
          require("checkmate").toggle("on_hold")
        end,
        desc = "",
        modes = { "n" },
      },
      ["<localleader>x"] = {
        rhs = function()
          require("checkmate").toggle("cancelled")
        end,
        desc = "",
        modes = { "n" },
      },
      ["<localleader>p"] = {
        rhs = function()
          require("checkmate").toggle("in_progress")
        end,
        desc = "",
        modes = { "n" },
      },
    },
    todo_states = {
      -- Built-in states (cannot change markdown or type)
      unchecked = { marker = "□" },
      checked = { marker = "✔" },

      -- Custom states
      in_progress = {
        marker = "◐",
        markdown = ".", -- Saved as `- [.]`
        type = "incomplete", -- Counts as "not done"
        order = 50,
      },
      cancelled = {
        marker = "✗",
        markdown = "c", -- Saved as `- [c]`
        type = "complete", -- Counts as "done"
        order = 2,
      },
      on_hold = {
        marker = "⏸",
        markdown = "/", -- Saved as `- [/]`
        type = "inactive", -- Ignored in counts
        order = 100,
      },
      important = {
        marker = "⚠️",
        markdown = "!",
        type = "inactive",
        order = 200,
      },
    },
  },
}
