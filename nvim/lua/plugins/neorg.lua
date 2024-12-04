return {
  "nvim-neorg/neorg",
  lazy = false, -- Disable lazy loading as some `lazy.nvim` distributions set `lazy = true` by default
  version = "*", -- Pin Neorg to the latest stable release
  config = true,
  opts = {
    load = {
      ["core.defaults"] = {},
      ["core.concealer"] = {
        config = {
          icon_preset = "diamond",
          icons = {
            todo = {
              pending = {
                icon = "",
              },
            },
          },
        },
      },
      ["core.completion"] = {
        config = {
          engine = "nvim-cmp",
        },
      },
      ["core.keybinds"] = {
        config = {
          -- default_keybinds = false,
        },
      },
      ["core.dirman"] = {
        config = {
          workspaces = {
            notes = "~/notes",
          },
          default_workspace = "notes",
          index = "index.norg",
        },
      },
    },
  },
}
