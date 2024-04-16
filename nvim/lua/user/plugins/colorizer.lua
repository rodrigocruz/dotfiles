return {
	"NvChad/nvim-colorizer.lua",
    config = function ()
        require("colorizer").setup({
            user_default_options = {
                tailwind = true,
                mode = "background",
            }
        })
    end,
	opts = {
		user_default_options = {
			names = false,
		},
	},
}
