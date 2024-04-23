return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")

		conform.setup({
			formatters_by_ft = {
				lua = { "stylua" },
				php = { "pint", "prettier" },
				blade = { "blade-formatter" },
				javascript = { "prettier" },
				typescriptreact = { "prettier" },
				json = { "prettier" },
				html = { "prettier" },
				yaml = { "prettier" },
				css = { "prettier" },
			},
			formatters = {
				prettier = {
					prepend_args = { "--tab-width=2" },
				},
			},
		})
	end,
}
