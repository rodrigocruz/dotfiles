local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  { import = 'plugins.alpha' },

  { import = 'plugins.autopairs' },

  { import = 'plugins.catppuccin' },

  { import = 'plugins.completions' },

  { import = 'plugins.debugging' },

  { import = 'plugins.fzf-lua' },

  { import = 'plugins.lsp-config' },

  { import = 'plugins.lualine' },

  { import = 'plugins.neogit' },

  { import = 'plugins.neotree' },

  { import = 'plugins.none-ls' },

  { import = 'plugins.telescope' },

  { import = 'plugins.tree-sitter' },

  { import = 'plugins.trouble' },

  { import = 'plugins.which-key' },

   -- Add, change, and delete surrounding text.
  { 'tpope/vim-surround' },

    -- Allow plugins to enable repeating of commands.
  { 'tpope/vim-repeat' },

    -- Enable * searching with visually selected text.
  { 'nelstrom/vim-visual-star-search' },

    -- Text objects for HTML attributes.
  { 'whatyouhide/vim-textobj-xmlattr', dependencies = 'kana/vim-textobj-user'  },

    -- Add smooth scrolling to avoid jarring jumps
  { 'karb94/neoscroll.nvim', config = true },
})
