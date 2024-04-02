return {
    "AckslD/nvim-neoclip.lua",
    dependencies = {
        "nvim-telescope/telescope.nvim",
    },
    opts = {
        keys = {
            telescope = {
                i = {
                    paste_behind = '<c-o>',
                }
            }
        }
    }
}

