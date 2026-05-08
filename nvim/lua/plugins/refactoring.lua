-- ~/.config/nvim/lua/plugins/refactoring.lua

return {
  {
    "ThePrimeagen/refactoring.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "lewis6991/async.nvim",
    },
    opts = {},
    config = function(_, opts)
      require("refactoring").setup(opts)

      -- Do NOT load the old telescope refactoring extension.
      -- It is missing in the current plugin version.
    end,
  },
}
