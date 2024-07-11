return {
	{
		"VonHeikemen/lsp-zero.nvim",
		branch = "v3.x",
		lazy = true,
		config = false,
		init = function()
			-- Disable automatic setup, we are doing it manually
			vim.g.lsp_zero_extend_cmp = 0
			vim.g.lsp_zero_extend_lspconfig = 0
		end,
	},
	{
		"williamboman/mason.nvim",
		lazy = false,
		config = true,
	},

	-- Autocompletion
	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			{ "L3MON4D3/LuaSnip" },
		},
		config = function()
			-- Here is where you configure the autocompletion settings.
			local lsp_zero = require("lsp-zero")
			lsp_zero.extend_cmp()

			-- And you can configure cmp even more, if you want to.
			local cmp = require("cmp")
			local cmp_action = lsp_zero.cmp_action()

			cmp.setup({
				mapping = {
					["<CR>"] = cmp.mapping.confirm({ select = false }),
					["<C-l>"] = cmp.mapping.complete(),
				},
				-- window = {
				-- 	completion = cmp.config.window.bordered(),
				-- 	documentation = cmp.config.window.bordered(),
				-- },
				formatting = lsp_zero.cmp_format({ details = true }),
				-- mapping = cmp.mapping.preset.insert({
				-- 	["<C-Space>"] = cmp.mapping.complete(),
				-- 	["<C-u>"] = cmp.mapping.scroll_docs(-4),
				-- 	["<C-d>"] = cmp.mapping.scroll_docs(4),
				-- 	["<C-f>"] = cmp_action.luasnip_jump_forward(),
				-- 	["<C-b>"] = cmp_action.luasnip_jump_backward(),
				-- }),
				snippet = {
					expand = function(args)
						require("luasnip").lsp_expand(args.body)
					end,
				},
			})
		end,
	},

	-- LSP
	{
		"neovim/nvim-lspconfig",
		cmd = { "LspInfo", "LspInstall", "LspStart" },
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "williamboman/mason-lspconfig.nvim" },
		},
		config = function()
			-- This is where all the LSP shenanigans will live
			local lsp_zero = require("lsp-zero")
			lsp_zero.extend_lspconfig()

			--- if you want to know more about lsp-zero and mason.nvim
			--- read this: https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/doc/md/guides/integrate-with-mason-nvim.md
			lsp_zero.on_attach(function(client, bufnr)
				-- see :help lsp-zero-keybindings
				-- to learn the available actions
				lsp_zero.default_keymaps({ buffer = bufnr })
			end)

			require("mason-lspconfig").setup({
				ensure_installed = {},
				handlers = {
					-- this first function is the "default handler"
					-- it applies to every language server without a "custom handler"
					function(server_name)
						require("lspconfig")[server_name].setup({})
					end,

					intelephense = function()
						require("lspconfig").intelephense.setup({
							filetypes = { "php", "blade" },
							commands = {
								IntelephenseIndex = {
									function()
										vim.lsp.buf.execute_command({ command = "intelephense.index.workspace" })
									end,
								},
							},
							on_attach = function(client, bufnr)
								client.server_capabilities.documentFormattingProvider = false
								client.server_capabilities.documentRangeFormattingProvider = false
								if client.server_capabilities.inlayHintProvider then
									vim.lsp.inlay_hint.enable(bufnr, true)
								end
							end,
							settings = {
								intelephense = {
									filetypes = { "php", "blade" },
									files = {
										associations = { "*.php", "*.blade.php" }, -- Associating .blade.php files as well
										maxSize = 5000000,
									},
								},
							},
						})
					end,

					emmet_ls = function()
						require("lspconfig").emmet_ls.setup({
							filetypes = {
								"css",
								"eruby",
								"html",
								"javascript",
								"javascriptreact",
								"less",
								"sass",
								"scss",
								"svelte",
								"pug",
								"typescriptreact",
								"vue",
								"blade",
							},
						})
					end,
				},
			})
		end,
	},
}
