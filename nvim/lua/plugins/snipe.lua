return {
  "leath-dub/snipe.nvim",
  opts = {},
  keys = {
    {
      "bl",
      function()
        require("snipe").toggle_buffer_menu()()
      end,
    },
  },
}
