return {
	"folke/trouble.nvim",
	branch = "dev",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {
		signs = {
			error = "",
			warning = "",
			hint = "",
			information = "",
			other = "",
		},
		focus = true,
		win = {
			size = { height = 0.3 },
		},
		modes = {
			preview_float = {
				mode = "diagnostics",
				preview = {
					type = "float",
					relative = "editor",
					border = "rounded",
					title = "Preview",
					title_pos = "center",
					position = { 0, -2 },
					size = { width = 0.3, height = 0.3 },
					zindex = 200,
				},
			},
		},
	},
}
