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
      opts.servers.kotlin_language_server = {
        cmd = { "kotlin-language-server" },
        on_new_config = function(new_config, _)
          local jdk17 = "/Library/Java/JavaVirtualMachines/temurin-17.jdk/Contents/Home"
          new_config.cmd_env = {
            JAVA_HOME = jdk17,
            PATH = jdk17 .. "/bin:" .. vim.env.PATH,
          }
        end,
      }

      return opts
    end,
  },
}
