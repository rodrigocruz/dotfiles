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
      ["<leader>oo"] = {
        rhs = "<cmd>Checkmate toggle<CR>",
        desc = "ooggle todo item",
        modes = { "n", "v" },
      },
      ["<leader>oc"] = {
        rhs = "<cmd>Checkmate check<CR>",
        desc = "Set todo item as checked (done)",
        modes = { "n", "v" },
      },
      ["<leader>ou"] = {
        rhs = "<cmd>Checkmate uncheck<CR>",
        desc = "Set todo item as unchecked (not done)",
        modes = { "n", "v" },
      },
      ["<leader>o="] = {
        rhs = "<cmd>Checkmate cycle_next<CR>",
        desc = "Cycle todo item(s) to the next state",
        modes = { "n", "v" },
      },
      ["<leader>o-"] = {
        rhs = "<cmd>Checkmate cycle_previous<CR>",
        desc = "Cycle todo item(s) to the previous state",
        modes = { "n", "v" },
      },
      ["<leader>on"] = {
        rhs = "<cmd>Checkmate create<CR>",
        desc = "Create todo item",
        modes = { "n", "v" },
      },
      ["<leader>or"] = {
        rhs = "<cmd>Checkmate remove<CR>",
        desc = "Remove todo marker (convert to text)",
        modes = { "n", "v" },
      },
      ["<leader>oR"] = {
        rhs = "<cmd>Checkmate remove_all_metadata<CR>",
        desc = "Remove all metadata from a todo item",
        modes = { "n", "v" },
      },
      ["<leader>oa"] = {
        rhs = "<cmd>Checkmate archive<CR>",
        desc = "Archive checked/completed todo items (move to bottom section)",
        modes = { "n" },
      },
      ["<leader>oF"] = {
        rhs = "<cmd>Checkmate select_todo<CR>",
        desc = "Open a picker to select a todo from the current buffer",
        modes = { "n" },
      },
      ["<leader>ov"] = {
        rhs = "<cmd>Checkmate metadata select_value<CR>",
        desc = "Update the value of a metadata tag under the cursor",
        modes = { "n" },
      },
      ["<leader>o]"] = {
        rhs = "<cmd>Checkmate metadata jump_next<CR>",
        desc = "Move cursor to next metadata tag",
        modes = { "n" },
      },
      ["<leader>o["] = {
        rhs = "<cmd>Checkmate metadata jump_previous<CR>",
        desc = "Move cursor to previous metadata tag",
        modes = { "n" },
      },
    },
  },
}
