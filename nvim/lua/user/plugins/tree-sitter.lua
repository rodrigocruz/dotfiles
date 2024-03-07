return {
	{
		"nvim-treesitter/nvim-treesitter",
		event = "VeryLazy",
		build = function()
			require("nvim-treesitter.install").update({ with_sync = true })
		end,
		dependencies = {
			{ "nvim-treesitter/playground", cmd = "TSPlaygroundToggle" },
			{
				"JoosepAlviste/nvim-ts-context-commentstring",
				opts = {
					custom_calculation = function(node, language_tree)
						if vim.bo.filetype == "blade" and language_tree._lang ~= "javascript" then
							return "{{-- %s --}}"
						end
					end,
				},
			},
			"nvim-treesitter/nvim-treesitter-textobjects",
		},
		config = function()
			local config = require("nvim-treesitter.configs")
			config.setup({
				auto_install = true,
				ensure_installed = {
					"comment",
					"css",
					"diff",
					"dockerfile",
					"git_config",
					"git_rebase",
					"gitattributes",
					"gitcommit",
					"gitignore",
					"html",
					"http",
					"ini",
					"javascript",
					"json",
					"jsonc",
					"lua",
					"make",
					"markdown",
					"php",
					"phpdoc",
					"python",
					"regex",
					"sql",
					"typescript",
					"vim",
					"vue",
					"xml",
					"yaml",
				},
				highlight = { enable = true },
				indent = {
					enable = true,
					disable = { "yaml" },
				},
				rainbow = {
					enable = true,
				},
				textobjects = {
					select = {
						enable = true,
						lookahead = true,
						keymaps = {
							["if"] = "@function.inner",
							["af"] = "@function.outer",
							["ia"] = "@parameter.inner",
							["aa"] = "@parameter.outer",
                            ["ac"] = "@class.outer",
                            ["ic"] = "@class.inner",
						},
					},
				},
			})

			local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
			parser_config.blade = {
				install_info = {
					url = "https://github.com/EmranMR/tree-sitter-blade",
					files = { "src/parser.c" },
					branch = "main",
				},
				filetype = "blade",
			}

			parser_config.phpdoc = {
				install_info = {
					url = "~/sources/treesitter/tree-sitter-phpdoc",
					files = {
						"src/parser.c",
						"src/scanner.c",
					},
					branch = "master",
					generate_requires_npm = true,
					requires_generate_from_grammar = true,
				},
				filetype = "php",
			}

			vim.filetype.add({
				pattern = {
					[".*%.blade.php"] = "blade",
				},
			})
		end,
	},
	-- {
	-- 	"EmranMR/tree-sitter-blade",
	-- },
}
