-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- make $ part of the keyword for php.
vim.api.nvim_exec([[ autocmd FileType php set iskeyword+=$ ]], false)

vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "htm" },
  callback = function()
    vim.b.autoformat = false
  end,
})

vim.api.nvim_create_autocmd("User", {
  pattern = { "XcodebuildBuildFinished", "XcodebuildTestsFinished" },
  callback = function(event)
    if event.data.cancelled then
      return
    end

    if event.data.success then
      require("trouble").close()
    elseif not event.data.failedCount or event.data.failedCount > 0 then
      if next(vim.fn.getqflist()) then
        require("trouble").open("quickfix")
      else
        require("trouble").close()
      end

      require("trouble").refresh()
    end
  end,
})

-- vim.api.nvim_create_augroup("NeorgKeybinds", { clear = true })
--
-- vim.api.nvim_create_autocmd("FileType", {
--   group = "NeorgKeybinds",
--   pattern = "norg",
--   callback = function()
--     require("config.keymaps.neorg-only")
--   end,
-- })
--
-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = { "norg", "neorg" },
--   callback = function()
--     if pcall(vim.treesitter.start) then
--       vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
--       vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
--     end
--   end,
-- })
--
-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = { "norg", "neorg" },
--   callback = function()
--     if pcall(vim.treesitter.start) then
--       vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
--       vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
--     end
--   end,
-- })
