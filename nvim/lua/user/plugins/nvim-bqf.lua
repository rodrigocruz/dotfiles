return {
	"kevinhwang91/nvim-bqf",
	dependencies = {
		"junegunn/fzf",
		config = function()
			vim.fn["fzf#install"]()
		end,
	},
	config = function() end,
}
