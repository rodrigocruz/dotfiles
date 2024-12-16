return {
  { -- other plugins
    {
      "sudar/vim-arduino-syntax",
      ft = "ino", -- Filetype for Arduino sketches
    },
  },
  {
    "anurag3301/nvim-platformio.lua",
    dependencies = {
      { "akinsho/nvim-toggleterm.lua" },
      { "nvim-telescope/telescope.nvim" },
      { "nvim-lua/plenary.nvim" },
    },
  },
}
