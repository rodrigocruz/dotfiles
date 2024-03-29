return {
	"nvimdev/lspsaga.nvim",
	config = function()
		require("lspsaga").setup({
            lightbulb = {
                enable = false,
            },
            outline = {
                win_width = 40,
            }
        })
	end,
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-tree/nvim-web-devicons",
	},
}
