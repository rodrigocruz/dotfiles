return {
  "epwalsh/obsidian.nvim",
  version = "*", -- recommended, use latest release instead of latest commit
  lazy = true,
  ft = "markdown",
  -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
  -- event = {
  --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
  --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
  --   -- refer to `:h file-pattern` for more examples
  --   "BufReadPre path/to/my-vault/*.md",
  --   "BufNewFile path/to/my-vault/*.md",
  -- },
  dependencies = {
    -- Required.
    "nvim-lua/plenary.nvim",

    -- see below for full list of optional dependencies 👇
  },
  opts = {
    workspaces = {
      {
        name = "work",
        path = "~/Library/Mobile Documents/iCloud~md~obsidian/Documents/Work",
      },
    },

    -- see below for full list of options 👇
    mappings = {
      -- overrides the 'gf' mapping to work on markdown/wiki links within your vault
      ["gf"] = {
        action = function()
          return require("obsidian").util.gf_passthrough()
        end,
        opts = { noremap = false, expr = true, buffer = true },
      },
      -- toggle check-boxes
      -- ["<leader>ch"] = {
      --   action = function()
      --     return require("obsidian").util.toggle_checkbox()
      --   end,
      --   opts = { buffer = true },
      -- },
    },
    completion = {
      nvim_cmp = true,
      min_chars = 2,
    },
  },
}
