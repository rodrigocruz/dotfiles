return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        tailwindcss = {
          settings = {
            tailwindCSS = {
              experimental = {
                classRegex = {
                  "@?class\\(([^]*)\\)",
                  "'([^']*)'",
                },
              },
            },
          },
        },
      },
    },
  },
  {
    "NvChad/nvim-colorizer.lua",
    opts = {
      user_default_options = {
        tailwind = true,
      },
    },
  },
  {
    "ruicsh/tailwind-hover.nvim",
    keys = {
      { "<leader><s-k>", "<cmd>TailwindHover<cr>", desc = "Tailwind: Hover" },
    },
    opts = {},
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
    },
  },
}
