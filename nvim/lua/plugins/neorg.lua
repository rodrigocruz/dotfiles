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
        config = { engine = { module_name = "external.lsp-completion" } },
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
      ["external.interim-ls"] = {
        config = {
          -- default config shown
          completion_provider = {
            -- Enable or disable the completion provider
            enable = true,

            -- Show file contents as documentation when you complete a file name
            documentation = true,

            -- Try to complete categories provided by Neorg Query. Requires `benlubas/neorg-query`
            categories = false,
          },
        },
      },
    },
  },
}
