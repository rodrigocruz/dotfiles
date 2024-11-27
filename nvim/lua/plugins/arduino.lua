return {
  { -- other plugins
    {
      "sudar/vim-arduino-syntax",
      ft = "ino", -- Filetype for Arduino sketches
    },
  },
  -- {
  --   "stevearc/vim-arduino",
  --   ft = "arduino",
  --   config = function()
  --     vim.g.arduino_cli_config_path = "/Users/rodrigocruz/.arduinoIDE/arduino-cli.yaml"
  --     vim.g.arduino_cli_exe = "arduino-cli"
  --
  --     -- Debug information
  --     print("Arduino CLI config path:", vim.g.arduino_cli_config_path)
  --     print("Arduino CLI executable:", vim.g.arduino_cli_exe)
  --
  --     -- Check if the config file exists
  --     local config_file = io.open(vim.g.arduino_cli_config_path, "r")
  --     if config_file then
  --       print("Arduino CLI config file found")
  --       config_file:close()
  --     else
  --       print("Arduino CLI config file not found!")
  --     end
  --
  --     -- Print the PATH
  --     print("System PATH:", vim.fn.getenv("PATH"))
  --   end,
  -- },
  {
    "anurag3301/nvim-platformio.lua",
    dependencies = {
      { "akinsho/nvim-toggleterm.lua" },
      { "nvim-telescope/telescope.nvim" },
      { "nvim-lua/plenary.nvim" },
    },
  },
}
