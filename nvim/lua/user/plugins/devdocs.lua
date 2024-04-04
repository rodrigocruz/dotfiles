return {
	"luckasRanarison/nvim-devdocs",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope.nvim",
		"nvim-treesitter/nvim-treesitter",
	},
	opts = {
		float_win = { -- passed to nvim_open_win(), see :h api-floatwin
			relative = "editor",
			height = 35,
			width = 200,
			border = "rounded",
		},
	},
}
