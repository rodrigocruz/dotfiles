return {
  "catppuccin/nvim",
  name = "catppuccin",
  config = function()
    require("catppuccin").setup({
      transparent_background = true, -- Enable transparency
    })
  end,
}
