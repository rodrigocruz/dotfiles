return {
  "folke/snacks.nvim",
  opts = {
    picker = {
      matcher = {
        frecency = true,
      },
      layout = {
        preset = "ivy",
        -- When reaching the bottom of the results in the picker, I don't want
        -- it to cycle and go back to the top
        cycle = false,
      },
      layouts = {
        -- Then call this layout in the keymaps above
        -- got example from here
        -- https://github.com/folke/snacks.nvim/discussions/468
        ivy = {
          layout = {
            width = 0,
            height = 0.8,
          },
        },
      },
    },
    lazygit = {
      theme = {
        selectedLineBgColor = { bg = "CursorLine" },
      },
      -- With this I make lazygit to use the entire screen, because by default there's
      -- "padding" added around the sides
      -- I asked in LazyGit, folke didn't like it xD xD xD
      -- https://github.com/folke/snacks.nvim/issues/719
      win = {
        -- -- The first option was to use the "dashboard" style, which uses a
        -- -- 0 height and width, see the styles documentation
        -- -- https://github.com/folke/snacks.nvim/blob/main/docs/styles.md
        -- style = "dashboard",
        -- But I can also explicitly set them, which also works, what the best
        -- way is? Who knows, but it works
        width = 0,
        height = 0,
      },
    },
  },
}
