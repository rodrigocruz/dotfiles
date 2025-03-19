return {
  { "V13Axel/neotest-pest" },
  { "nvim-neotest/neotest-jest" },
  {
    "nvim-neotest/neotest",
    opts = { adapters = { "neotest-pest", "neotest-jest" } },
  },
}
