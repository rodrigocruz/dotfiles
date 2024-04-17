return {
    "NeogitOrg/neogit",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "sindrets/diffview.nvim",
        "nvim-telescope/telescope.nvim",
    },
    config = function()
        require("neogit").setup({
            mappings = {
                finder = {
                    ["<c-j>"] = "Next",
                    ["<c-k>"] = "Previous",
                }
            },
            integrations = {
                telescope = true,
                diffview = true,
            }
        })
    end,
}
