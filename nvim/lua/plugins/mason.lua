-- tools / binaries
return {
  "mason-org/mason.nvim",
  opts = {
    ensure_installed = {
      -- tools & formatters
      "black",
      "blade-formatter",
      "eslint_d",
      "isort",
      "markdownlint-cli2",
      "php-cs-fixer",
      "phpstan",
      "prettierd",
      "rustywind",
      "shfmt",
      "stylua",
      "swiftformat",
      "swiftlint",
      "pint",

      -- language servers (also OK here, but mainly installed via mason-lspconfig)
      "bash-language-server",
      "emmet-language-server",
      "html-lsp",
      "intelephense",
      "pyright",
      "tailwindcss-language-server",
    },
  },
}
