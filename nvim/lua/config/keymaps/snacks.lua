vim.keymap.set("n", "<leader><space>", function()
  Snacks.picker.smart({ multi = { "files" } })
end, { desc = "Find Files (Root Dir)" })

vim.keymap.set("n", "<leader>sm", function()
  Snacks.picker.lsp_symbols({
    filter = {
      default = { "Method", "Function" },
    },
  })
end, { desc = "Snacks: Methods / Functions only" })

vim.keymap.set("n", "<leader>sv", function()
  Snacks.picker.lsp_symbols({
    filter = {
      default = { "Variable", "Field", "Property", "Constant" },
    },
  })
end, { desc = "Snacks: Variables / Fields / Properties / Constants" })
