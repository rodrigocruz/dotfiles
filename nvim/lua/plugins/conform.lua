return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      lua = { "stylua" },
      fish = { "fish_indent" },
      sh = { "shfmt" },
      php = { "pint", "php_cs_fixer" },
      blade = { "blade-formatter", "rustywind" },
      python = { "black" },
      javascript = { "prettier" },
      html = { "prettier" },
      css = { "prettier" },
      vue = { "prettier" },
      json = { "prettier" },
      yaml = { "prettier" },
    },
  },
}
