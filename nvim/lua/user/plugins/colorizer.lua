return {
	"NvChad/nvim-colorizer.lua",
    config = function ()
        require("colorizer").setup({
            user_default_options = {
                tailwind = false,
            }
        })
    end,
	opts = {
		user_default_options = {
			names = false,
		},
	},
}
