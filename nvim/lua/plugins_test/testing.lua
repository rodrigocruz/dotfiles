return {
  "nvim-neotest/neotest",
  dependencies = {
    "V13Axel/neotest-pest",
  },
  config = function()
    require("neotest").setup({
      adapters = {
        require("neotest-pest"),
      },
      icons = {
        expanded = "",
        child_prefix = "",
        child_indent = "",
        final_child_prefix = "",
        non_collapsible = "",
        collapsed = "",

        passed = "",
        running = "",
        failed = "",
        unknown = "",
      },
    })
  end,
}
