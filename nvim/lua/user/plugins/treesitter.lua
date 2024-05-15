return {
	"nvim-treesitter/nvim-treesitter",
	event = { "BufReadPre", "BufNewFile" },
	build = ":TSUpdate",
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
		"windwp/nvim-ts-autotag",
	},
	config = function()
		local treesitter = require("nvim-treesitter.configs")

		treesitter.setup({
			highlight = { enable = true },
			indent = {
				enable = true,
				disable = { "yaml" },
			},
			autotag = { enable = true },
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
				"markdown_inline",
				"php",
				-- "phpdoc",
				"python",
				"regex",
				"sql",
				"typescript",
				"vim",
				"vue",
				"xml",
				"yaml",
				"swift",
				"c_sharp",
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
			matchup = {
				enable = true,
				disable = {},
			},
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "<C-s>",
					node_incremental = "<C-s>",
					scope_incremental = false,
					node_decremental = "<bs>",
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

		-- parser_config.phpdoc = {
		-- 	install_info = {
		-- 		url = "~/sources/treesitter/tree-sitter-phpdoc",
		-- 		files = {
		-- 			"src/parser.c",
		-- 			"src/scanner.c",
		-- 		},
		-- 		branch = "master",
		-- 		generate_requires_npm = true,
		-- 		requires_generate_from_grammar = true,
		-- 	},
		-- 	filetype = "php",
		-- }

		vim.filetype.add({
			pattern = {
				[".*%.blade.php"] = "blade",
			},
		})
	end,
}
