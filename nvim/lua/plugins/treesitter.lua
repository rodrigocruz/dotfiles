-- add more treesitter parsers
-- return {
--   -- Add a Treesitter parser for Laravel Blade to provide Blade syntax highlighting.
--   "nvim-treesitter/nvim-treesitter",
--   opts = {
--     highlight = {
--       enable = true,
--     },
--   },
-- }
return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    local configs = require("nvim-treesitter.configs")
    local parser_config = require("nvim-treesitter.parsers").get_parser_configs()

    parser_config.blade = {
      install_info = {
        url = "https://github.com/EmranMR/tree-sitter-blade",
        files = { "src/parser.c" },
        branch = "main",
      },
      filetype = "blade",
    }

    vim.filetype.add({
      pattern = {
        [".*%.blade%.php"] = "blade",
      },
    })

    configs.setup({
      ensure_installed = {
        "c",
        "lua",
        "javascript",
        "bash",
        "html",
        "css",
        "python",
        "php",
        "blade",
      },
      sync_install = false,
      highlight = { enable = true },
      indent = { enable = true },
    })
  end,
}
