-- tools / binaries
return {
  "mason-org/mason.nvim",
  opts = {
    ensure_installed = {
      -- tools & formatters
      "blade-formatter",
      "eslint_d",
      "phpstan",
      "prettierd",
      "stylua",
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
