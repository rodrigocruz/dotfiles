return {
  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      inlay_hints = { enabled = false },
      servers = {
        intelephense = {
          format = {
            braces = "k&r",
          },
          filetypes = { "php", "blade" },
          files = {
            associations = { "*.php", "*.blade.php" }, -- Associating .blade.php files as well
            maxSize = 5000000,
          },
        },
        twiggy_language_server = {
          filetypes = { "twig", "html" },
        },
        tailwindcss = {
          filetypes = { "html", "htm" },
        },
        yamlls = {},
        sourcekit = {},
      },
    },
  },
}
