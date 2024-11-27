return {
  "kylechui/nvim-surround",
  version = "*", -- Use for stability; omit to use `main` branch for the latest features
  event = "VeryLazy",
  config = function()
    require("nvim-surround").setup({
      -- Configuration here, or leave empty to use defaults
      keymaps = {
        insert = "<C-g>s",
        insert_line = "<C-g>S",
        normal = "gys",
        normal_cur = "gyss",
        normal_line = "gyS",
        normal_cur_line = "gySS",
        visual = "S",
        visual_line = "gS",
        delete = "gds",
        change = "gcs",
        change_lineg = "gcS",
      },
    })
  end,
}
