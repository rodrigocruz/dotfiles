return {
	"NeogitOrg/neogit",
	branch = "master",
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
				},
			},
			integrations = {
				telescope = true,
				diffview = true,
			},
			commit_editor = {
				-- kind = "vsplit",
				show_staged_diff = true,
			},
		})
	end,
}
