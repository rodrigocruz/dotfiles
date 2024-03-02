for i = 1, 6 do
  local lhs = "<Leader>" .. i
  local rhs = i .. "<C-W>w"
  vim.keymap.set('n', lhs, rhs, { desc = "Move to window " .. i })
end
