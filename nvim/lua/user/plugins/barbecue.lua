return {
    "utilyre/barbecue.nvim",
    config = function ()
        require("barbecue").setup({
          attach_navic = false, -- prevent barbecue from automatically attaching nvim-navic
        })
    end,
    event = "BufRead",
    dependencies = {
        "SmiteshP/nvim-navic",
        "nvim-tree/nvim-web-devicons",
    },
    opts = {
        theme = "tokyonight",
    },
}
