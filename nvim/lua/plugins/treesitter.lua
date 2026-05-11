return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      local install = require("nvim-treesitter.install")
      install.compilers = { "gcc-14" }

      opts.ensure_installed = opts.ensure_installed or {}
      for _, parser in ipairs({
        "lua",
        "php",
        "html",
        "css",
        "javascript",
        "typescript",
        "json",
        "swift",
        "blade",
      }) do
        if not vim.tbl_contains(opts.ensure_installed, parser) then
          table.insert(opts.ensure_installed, parser)
        end
      end
    end,
  },
}
