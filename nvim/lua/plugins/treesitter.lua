return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  build = ":TSUpdate",
  config = function()
    local install = require("nvim-treesitter.install")
    install.compilers = { "gcc-14" }

    -- Register blade as a custom parser
    vim.treesitter.language.register("blade", "blade")

    require("nvim-treesitter").setup({
      ensure_installed = {
        "lua",
        "php",
        "html",
        "css",
        "javascript",
        "typescript",
        "json",
      },
      highlight = { enable = true },
      indent = { enable = true },
    })

    -- Filetype detection
    vim.filetype.add({
      pattern = {
        [".*%.blade%.php"] = "blade",
      },
    })
  end,
}
