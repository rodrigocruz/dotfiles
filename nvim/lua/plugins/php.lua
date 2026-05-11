return {
  {
    -- Remove phpcs linter.
    "mfussenegger/nvim-lint",
    optional = true,
    opts = {
      linters_by_ft = {
        php = {},
      },
    },
  },
  -- {
  --   "nvim-neotest/neotest",
  --   dependencies = { "V13Axel/neotest-pest" },
  --   opts = {
  --     adapters = { "neotest-pest" },
  --   },
  -- },
  {
    -- Add the blade-nav.nvim plugin which provides Goto File capabilities
    -- for Blade files.
    "ricardoramirezr/blade-nav.nvim",
    ft = { "blade", "php" },
    opts = {
      integrations = {
        gf = true,
        cmp = false,
        blink = false,
        coq = false,
        health = true,
      },
    },
  },
}
