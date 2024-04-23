return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"nvim-tree/nvim-web-devicons",
		"nvim-telescope/telescope-live-grep-args.nvim",
	},
	config = function()
        local telescope = require("telescope")
		local actions = require("telescope.actions")

		telescope.setup({
			defaults = {
				path_display = { "smart" },
                mappings = {
                    i = {
                        ["<esc>"] = actions.close,
                        ["<C-j>"] = actions.move_selection_next,
                        ["<C-k>"] = actions.move_selection_previous,
                        ["<C-d>"] = require("telescope.actions").delete_buffer,
                        ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
                    },
                },
				prompt_prefix = "   ",
				selection_caret = "  ",
				layout_config = {
					prompt_position = "top",
					horizontal = {
						prompt_position = "top",
						preview_width = 0.55,
						results_width = 0.8,
					},
					vertical = {
						mirror = false,
					},
					-- width = 0.87,
					-- height = 0.80,
					preview_cutoff = 120,
				},
				preview = {
					timeout = 200,
				},
				sorting_strategy = "ascending",
				file_ignore_patterns = { ".git/" },
				winblend = 0,
				border = {},
				borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
				color_devicons = true,
				use_less = true,
				set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
			},
			extensions = {
				dash = {},
				live_grep_args = {
					mappings = {
						i = {
							["<C-k>"] = require("telescope-live-grep-args.actions").quote_prompt(),
							["<C-i>"] = require("telescope-live-grep-args.actions").quote_prompt({
								postfix = " --iglob ",
							}),
						},
					},
				},
			},
			pickers = {
				find_files = {
					hidden = true,
				},
				buffers = {
					previewer = false,
					layout_config = {
						width = 80,
					},
				},
				oldfiles = {
					prompt_title = "History",
				},
				lsp_references = {
					previewer = false,
				},
				lsp_definitions = {
					previewer = false,
				},
				lsp_document_symbols = {
					symbol_width = 55,
				},
			},
		})

		require("telescope").load_extension("fzf")
	end,
}
