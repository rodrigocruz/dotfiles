return {
  "folke/snacks.nvim",
  opts = {
    win = {
      -- input window
      input = {
        keys = {
          -- to close the picker on ESC instead of going to normal mode,
          -- add the following keymap to your config
          -- ["<Esc>"] = { "close", mode = { "n", "i" } },
          ["/"] = "toggle_focus",
          ["<C-Down>"] = { "history_forward", mode = { "i", "n" } },
          ["<C-Up>"] = { "history_back", mode = { "i", "n" } },
          ["<C-c>"] = { "close", mode = "i" },
          ["<C-w>"] = { "<c-s-w>", mode = { "i" }, expr = true, desc = "delete word" },
          ["<CR>"] = { "confirm", mode = { "n", "i" } },
          ["<Down>"] = { "list_down", mode = { "i", "n" } },
          ["<Esc>"] = "close",
          ["<S-CR>"] = { { "pick_win", "jump" }, mode = { "n", "i" } },
          ["<S-Tab>"] = { "select_and_prev", mode = { "i", "n" } },
          ["<Tab>"] = { "select_and_next", mode = { "i", "n" } },
          ["<Up>"] = { "list_up", mode = { "i", "n" } },
          ["<a-d>"] = { "inspect", mode = { "n", "i" } },
          ["<a-f>"] = { "toggle_follow", mode = { "i", "n" } },
          ["<a-h>"] = { "toggle_hidden", mode = { "i", "n" } },
          ["<a-i>"] = { "toggle_ignored", mode = { "i", "n" } },
          ["<a-m>"] = { "toggle_maximize", mode = { "i", "n" } },
          ["<a-p>"] = { "toggle_preview", mode = { "i", "n" } },
          ["<a-w>"] = { "cycle_win", mode = { "i", "n" } },
          ["<c-a>"] = { "select_all", mode = { "n", "i" } },
          ["<c-b>"] = { "preview_scroll_up", mode = { "i", "n" } },
          ["<c-d>"] = { "list_scroll_down", mode = { "i", "n" } },
          ["<c-f>"] = { "preview_scroll_down", mode = { "i", "n" } },
          ["<c-g>"] = { "toggle_live", mode = { "i", "n" } },
          ["<c-j>"] = { "list_down", mode = { "i", "n" } },
          ["<c-k>"] = { "list_up", mode = { "i", "n" } },
          ["<c-n>"] = { "list_down", mode = { "i", "n" } },
          ["<c-p>"] = { "list_up", mode = { "i", "n" } },
          ["<c-q>"] = { "qflist", mode = { "i", "n" } },
          ["<c-s>"] = { "edit_split", mode = { "i", "n" } },
          ["<c-t>"] = { "tab", mode = { "n", "i" } },
          ["<c-u>"] = { "list_scroll_up", mode = { "i", "n" } },
          ["<c-v>"] = { "edit_vsplit", mode = { "i", "n" } },
          ["<c-w>H"] = "layout_left",
          ["<c-w>J"] = "layout_bottom",
          ["<c-w>K"] = "layout_top",
          ["<c-w>L"] = "layout_right",
          ["?"] = "toggle_help_input",
          ["G"] = "list_bottom",
          ["gg"] = "list_top",
          ["j"] = "list_down",
          ["k"] = "list_up",
          ["q"] = "close",
        },
      },
    },
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
    smart = {},
  },
}
