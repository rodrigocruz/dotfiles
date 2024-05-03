return {
	"rcarriga/nvim-notify",
	config = function()
		local stages = require("notify.stages.slide")("top_down")
		require("notify").setup({
			stages = {
				function(...)
					local opts = stages[1](...)
					if opts then
						opts.border = "none"
					end
					return opts
				end,
				unpack(stages, 2),
			},
			background_colour = "NotifyBackground",
			fps = 30,
			icons = {
				DEBUG = "",
				ERROR = "",
				INFO = "",
				TRACE = "✎",
				WARN = "",
			},
			level = 2,
			minimum_width = 50,
			render = "compact",
			-- stages = "fade_in_slide_out",
			time_formats = {
				notification = "%T",
				notification_history = "%FT%T",
			},
			timeout = 2000,
			top_down = true,
		})
	end,
}
