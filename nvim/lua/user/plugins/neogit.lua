return {
    "NeogitOrg/neogit",
    dependencies = {
        "nvim-lua/plenary.nvim",   -- required
        "sindrets/diffview.nvim",  -- optional - Diff integration
        "nvim-telescope/telescope.nvim", -- optional
    },
    config = function()
        require("neogit").setup({
            mappings = {
                finder = {
                    ["<C-j>"] = "Next",
                    ["<C-k>"] = "Previous",
                }
            }
        })
    end,
}
