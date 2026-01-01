return {
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      -- disable unwanted servers
      opts.servers = vim.tbl_extend("force", opts.servers or {}, {
        omnisharp = false,
        fsautocomplete = false,
      })

      -- your own configuration
      opts.inlay_hints = { enabled = false }
      opts.servers.intelephense = {
        settings = {
          format = { braces = "k&r" },
          filetypes = { "php", "blade" },
          files = {
            associations = { "*.php", "*.blade.php" },
            maxSize = 5000000,
          },
        },
        init_options = {},
      }
      opts.servers.twiggy_language_server = { filetypes = { "twig", "html", "htm" } }
      opts.servers.tailwindcss = { filetypes = { "html", "htm" } }
      opts.servers.cssls = {
        settings = {
          css = { validate = true },
          scss = { validate = true },
          less = { validate = true },
        },
        filetypes = { "css", "scss", "less" },
      }
      opts.servers.yamlls = {}
      opts.servers.sourcekit = {}
      opts.servers.emmet_ls = {
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
      }

      return opts
    end,
  },
}
