return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-cmdline",
		"hrsh7th/nvim-cmp",
		"L3MON4D3/LuaSnip",
		"saadparwaiz1/cmp_luasnip",
		"j-hui/fidget.nvim",
	},

	config = function()
		local cmp = require("cmp")
		local cmp_lsp = require("cmp_nvim_lsp")
		local capabilities = vim.tbl_deep_extend(
			"force",
			{},
			vim.lsp.protocol.make_client_capabilities(),
			cmp_lsp.default_capabilities()
		)

		require("fidget").setup({})
		require("mason").setup()
		require("mason-lspconfig").setup({
			ensure_installed = {
				"lua_ls",
				"intelephense",
				"tailwindcss",
				"cssls",
				"emmet_ls",
				"html",
				"jsonls",
				"tsserver",
				"yamlls",
				"antlersls",
				"volar",
			},
			handlers = {
				function(server_name) -- default handler (optional)
					require("lspconfig")[server_name].setup({
						capabilities = capabilities,
					})
				end,

				["lua_ls"] = function()
					local lspconfig = require("lspconfig")
					lspconfig.lua_ls.setup({
						capabilities = capabilities,
						settings = {
							Lua = {
								runtime = { version = "Lua 5.1" },
								diagnostics = {
									globals = { "vim", "it", "describe", "before_each", "after_each" },
								},
							},
						},
					})
				end,

				["tsserver"] = function()
					local lspconfig = require("lspconfig")
					lspconfig.tsserver.setup({
						init_options = {
							plugins = {
								{
									name = "@vue/typescript-plugin",
									location = "/usr/local/lib/node_modules/@vue/typescript-plugin",
									languages = { "javascript", "typescript", "vue" },
								},
							},
						},
						filetypes = {
							"javascript",
							"typescript",
							"vue",
						},
					})
				end,
				["volar"] = function()
					local lspconfig = require("lspconfig")
					lspconfig.volar.setup({
						capabilities = capabilities,
						on_attach = function(client, bufnr)
							client.server_capabilities.documentFormattingProvider = false
							client.server_capabilities.documentRangeFormattingProvider = false
							if client.server_capabilities.inlayHintProvider then
								vim.lsp.inlay_hint.enable(bufnr, true)
							end
						end,
					})
				end,
				["intelephense"] = function()
					local lspconfig = require("lspconfig")
					lspconfig.intelephense.setup({
						capabilities = capabilities,
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
				["emmet_ls"] = function()
					local lspconfig = require("lspconfig")
					lspconfig.emmet_ls.setup({
						capabilities = capabilities,
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
							-- "typescriptreact",
							"vue",
							"blade",
						},
					})
				end,
				-- ["jsonls"] = function()
				-- 	local lspconfig = require("lspconfig")
				-- 	lspconfig.jsonls.setup({
				-- 		capabilities = capabilities,
				-- 		settings = {
				-- 			json = {
				-- 				schemas = require("schemastore").json.schemas(),
				-- 			},
				-- 		},
				-- 	})
				-- end,
				["phpactor"] = function()
					local lspconfig = require("lspconfig")
					lspconfig.phpactor.setup({
						capabilities = capabilities,
						on_attach = function(client, bufnr)
							client.server_capabilities.completionProvider = false
							client.server_capabilities.hoverProvider = false
							client.server_capabilities.implementationProvider = false
							client.server_capabilities.referencesProvider = false
							client.server_capabilities.renameProvider = false
							client.server_capabilities.selectionRangeProvider = false
							client.server_capabilities.signatureHelpProvider = false
							client.server_capabilities.typeDefinitionProvider = false
							client.server_capabilities.workspaceSymbolProvider = false
							client.server_capabilities.definitionProvider = false
							client.server_capabilities.documentHighlightProvider = false
							client.server_capabilities.documentSymbolProvider = false
							client.server_capabilities.documentFormattingProvider = false
							client.server_capabilities.documentRangeFormattingProvider = false
						end,
						init_options = {
							["language_server_phpstan.enabled"] = false,
							["language_server_psalm.enabled"] = false,
						},
						handlers = {
							["textDocument/publishDiagnostics"] = function() end,
						},
					})
				end,
				["cssls"] = function()
					local lspconfig = require("lspconfig")
					lspconfig.cssls.setup({
						settings = {
							css = {
								validate = true,
								lint = {
									unknownAtRules = "ignore",
								},
							},
							scss = {
								validate = true,
								lint = {
									unknownAtRules = "ignore",
								},
							},
							less = {
								validate = true,
								lint = {
									unknownAtRules = "ignore",
								},
							},
						},
					})
				end,
			},
		})

		local cmp_select = { behavior = cmp.SelectBehavior.Select }

		cmp.setup({
			snippet = {
				expand = function(args)
					require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
				end,
			},
			-- mapping = cmp.mapping.preset.insert({
			-- 	["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
			-- 	["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
			-- 	["<C-y>"] = cmp.mapping.confirm({ select = true }),
			-- 	["<C-Space>"] = cmp.mapping.complete(),
			-- }),
			sources = cmp.config.sources({
				{ name = "nvim_lsp" },
				{ name = "luasnip" }, -- For luasnip users.
			}, {
				{ name = "buffer" },
			}),
		})

		vim.diagnostic.config({
			-- update_in_insert = true,
			float = {
				focusable = false,
				style = "minimal",
				border = "rounded",
				source = "always",
				header = "",
				prefix = "",
			},
		})
		-- Sign configuration
		vim.fn.sign_define("DiagnosticSignError", { text = "", texthl = "DiagnosticSignError" })
		vim.fn.sign_define("DiagnosticSignWarn", { text = "", texthl = "DiagnosticSignWarn" })
		vim.fn.sign_define("DiagnosticSignInfo", { text = "", texthl = "DiagnosticSignInfo" })
		vim.fn.sign_define("DiagnosticSignHint", { text = "", texthl = "DiagnosticSignHint" })
	end,
}
