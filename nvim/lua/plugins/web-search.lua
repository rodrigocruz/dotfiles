return {
  {
    "lalitmee/browse.nvim",
    dependencies = { "nvim-telescope/telescope.nvim" },
    cmd = "Browse",
    opts = {
      provider = "google",
    },
  },
  {
    "voldikss/vim-browser-search",
    cmd = "BrowserSearch",
  },
}
