return {
  "stevearc/conform.nvim",
  opts = function()
    local opts = {
      default_format_opts = {
        timeout_ms = 3000,
      },
      formatters_by_ft = {
        lua = { "stylua" },
        fish = { "fish_indent" },
        sh = { "shfmt" },
        swift = { "swiftformat" },
        html = { "prettier" },
        javascript = { "prettier" },
        css = { "prettier" },
        typescript = { "prettier" },
        javascriptreact = { "prettier" },
        typescriptreact = { "prettier" },
        svelte = { "prettier" },
        json = { "prettier" },
        yaml = { "prettier" },
        markdown = { "prettier" },
        graphql = { "prettier" },
        python = { "isort", "black" },
        php = { "pint", "php_cs_fixer" },
        blade = { "blade-formatter", "rustywind" },
      },
    }
    return opts
  end,
}
