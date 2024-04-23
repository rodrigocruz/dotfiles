return {
	"williamboman/mason.nvim",
    event = "VeryLazy",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
        "neovim/nvim-lspconfig",
	},
	config = function()
		-- import mason
		local mason = require("mason")

		-- import mason-lspconfig
		-- local mason_lspconfig = require("mason-lspconfig")

		-- enable mason and configure icons
		mason.setup({
			ui = {
                height = 0.8,
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})

		-- mason_lspconfig.setup({
		-- 	-- list of servers for mason to install
		-- 	ensure_installed = {
                -- "lua_ls",
                -- "intelephense",
                -- "tailwindcss",
                -- "cssls",
                -- "emmet_ls",
                -- "html",
                -- "jsonls",
                -- "tsserver",
                -- "yamlls",
                -- "antlersls",
                -- "volar",
		-- 	},
		-- })
	end,
}
