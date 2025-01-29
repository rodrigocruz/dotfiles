return {
  "saghen/blink.cmp",
  opts = {
    completion = {
      trigger = {
        -- When both this and show_on_trigger_character are false, will show the completion window
        -- when the cursor comes after a trigger character after accepting an item
        show_on_accept_on_trigger_character = false,
        -- When both this and show_on_trigger_character are false, will show the completion window
        -- when the cursor comes after a trigger character when entering insert mode
        show_on_insert_on_trigger_character = false,
      },
    },
    -- signature = { enabled = true },
    sources = {
      -- adding any nvim-cmp sources here will enable them
      -- with blink.compat
      compat = {},
      default = { "lsp", "path", "snippets", "buffer" },
      cmdline = {},
    },
  },
}
