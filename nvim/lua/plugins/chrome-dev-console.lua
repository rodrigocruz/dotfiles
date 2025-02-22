return {
  "lucamot/chrome-dev-console.nvim",
  dependencies = { "lucamot/chrome-remote.nvim" },
  opts = {
    console_window = {
      height = 10, -- Height of the split window
      placement = "below", -- 'left', 'right', 'above', 'below'
    },
    auto_close_page = true, -- Close webpage when console buffer is deleted
  },
}
