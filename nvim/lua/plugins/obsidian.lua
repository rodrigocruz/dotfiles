return {
  "obsidian-nvim/obsidian.nvim",
  version = "*", -- recommended, use latest release instead of latest commit
  ft = "markdown",
  -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
  -- event = {
  --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
  --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
  --   -- refer to `:h file-pattern` for more examples
  --   "BufReadPre path/to/my-vault/*.md",
  --   "BufNewFile path/to/my-vault/*.md",
  -- },
  ---@module 'obsidian'
  ---@type obsidian.config
  opts = {
    workspaces = {
      {
        name = "Projects",
        path = "~/Library/CloudStorage/ProtonDrive-mail@rodrigocruz.pt-folder/obsidian/Projects/",
      },
      {
        name = "Electronics",
        path = "~/Library/CloudStorage/ProtonDrive-mail@rodrigocruz.pt-folder/obsidian/electronics/",
      },
      {
        name = "Ios Projects",
        path = "~/Library/CloudStorage/ProtonDrive-mail@rodrigocruz.pt-folder/obsidian/ios projects/",
      },
      {
        name = "Guitar",
        path = "~/Library/CloudStorage/ProtonDrive-mail@rodrigocruz.pt-folder/obsidian/guitar/",
      },
      {
        name = "Programming",
        path = "~/Library/CloudStorage/ProtonDrive-mail@rodrigocruz.pt-folder/obsidian/Programming/",
      },
    },
  },
}
