return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		{ "antosha417/nvim-lsp-file-operations", config = true },
		{ "folke/neodev.nvim", opts = {} },
		"b0o/schemastore.nvim",
	},
	config = function()
		local lspconfig = require("lspconfig")
		local mason_lspconfig = require("mason-lspconfig")
		local cmp_nvim_lsp = require("cmp_nvim_lsp")

		mason_lspconfig.setup({
			-- list of servers for mason to install
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
		})

		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspConfig", {}),
			callback = function(ev)
				local opts = { buffer = ev.buf, silent = true }
			end,
		})

		local capabilities = cmp_nvim_lsp.default_capabilities()

		local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
		end

		mason_lspconfig.setup_handlers({
			function(server_name)
				lspconfig[server_name].setup({
					capabilities = capabilities,
				})
			end,
			["tsserver"] = function()
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
			["jsonls"] = function()
				lspconfig.jsonls.setup({
					capabilities = capabilities,
					settings = {
						json = {
							schemas = require("schemastore").json.schemas(),
						},
					},
				})
			end,
			["phpactor"] = function()
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
			["lua_ls"] = function()
				-- configure lua server (with special settings)
				lspconfig["lua_ls"].setup({
					capabilities = capabilities,
					settings = {
						Lua = {
							-- make the language server recognize "vim" global
							diagnostics = {
								globals = { "vim" },
							},
							completion = {
								callSnippet = "Replace",
							},
						},
					},
				})
			end,
		})

		-- Diagnostic configuration
		vim.diagnostic.config({
			virtual_text = true,
			float = {
				source = true,
			},
		})
	end,
}
