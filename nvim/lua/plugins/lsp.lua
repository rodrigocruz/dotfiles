return {
  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      inlay_hints = { enabled = false },
      servers = {
        intelephense = {
          settings = {
            format = {
              braces = "k&r",
            },
            filetypes = { "php", "blade" },
            files = {
              associations = { "*.php", "*.blade.php" }, -- Associating .blade.php files as well
              maxSize = 5000000,
            },
          },
          init_options = {},
        },
        twiggy_language_server = {
          filetypes = { "twig", "html", "htm" },
        },
        tailwindcss = {
          filetypes = { "html", "htm" },
        },
        cssls = {
          settings = {
            css = { validate = true },
            scss = { validate = true },
            less = { validate = true },
          },
          filetypes = { "css", "scss", "less" },
        },
        yamlls = {},
        sourcekit = {},
        emmet_ls = {
          filetypes = {
            "astro",
            "blade",
            "blade.php",
            "css",
            "scss",
            "html",
            "javascriptreact",
            "less",
            "sass",
            "scss",
            "svelte",
            "typescriptreact",
            "vue",
          },
        },
      },
    },
  },
}
