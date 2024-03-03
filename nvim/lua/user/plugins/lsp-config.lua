return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
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
            })
        end,
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            local capabilities = require("cmp_nvim_lsp").default_capabilities()

            local lspconfig = require("lspconfig")

            lspconfig.tsserver.setup({
                capabilities = capabilities,
            })
            -- lspconfig.volar.setup({
            --     capabilities = capabilities,
            --     on_attach = function(client, bufnr)
            --         client.server_capabilities.documentFormattingProvider = false
            --         client.server_capabilities.documentRangeFormattingProvider = false
            --         -- if client.server_capabilities.inlayHintProvider then
            --         --   vim.lsp.buf.inlay_hint(bufnr, true)
            --         -- end
            --     end,
            --     -- Enable "Take Over Mode" where volar will provide all JS/TS LSP services
            --     -- This drastically improves the responsiveness of diagnostic updates on change
            --     filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
            -- })
            lspconfig.html.setup({
                capabilities = capabilities,
            })
            lspconfig.lua_ls.setup({
                capabilities = capabilities,
            })
            lspconfig.intelephense.setup({
                capabilities = capabilities,
                filetypes = { "php", "blade" },
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
            lspconfig.tailwindcss.setup({
                capabilities = capabilities,
            })
            lspconfig.cssls.setup({
                capabilities = capabilities,
            })
            lspconfig.emmet_ls.setup({
                capabilities = capabilities,
            })
            lspconfig.jsonls.setup({
                capabilities = capabilities,
            })
            lspconfig.yamlls.setup({
                capabilities = capabilities,
            })

            lspconfig.lua_ls.setup({})

            -- vim.keymap.set('n', '<space>z', vim.diagnostic.open_float)
            --vim.keymap.set('n', '<space>en', vim.diagnostic.goto_next)
            --vim.keymap.set('n', '<space>ep', vim.diagnostic.goto_prev)
            --vim.keymap.set('n', '<space>el', vim.diagnostic.setloclist)
            vim.api.nvim_create_autocmd("LspAttach", {
                group = vim.api.nvim_create_augroup("UserLspConfig", {}),
                callback = function(ev)
                    -- Enable completion triggered by <c-x><c-o>
                    -- vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'
                    vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

                    -- Buffer local mappings.
                    -- See `:help vim.lsp.*` for documentation on any of the below functions
                    local opts = { buffer = ev.buf }
                    -- vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
                    --vim.keymap.set('n', '<space>cd', vim.lsp.buf.definition, opts)
                    -- vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
                    -- vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
                    -- vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
                    -- vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
                    -- vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
                    -- vim.keymap.set('n', '<space>wl', function()
                    --   print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
                    -- end, opts)
                    -- vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
                    -- vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
                    --vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
                    -- vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
                    -- vim.keymap.set('n', '<space>f', function()
                    -- vim.lsp.buf.format { async = true } end, opts)
                end,
            })

            -- Diagnostic configuration
            vim.diagnostic.config({
                virtual_text = false,
                float = {
                    source = true,
                }
            })

            -- Sign configuration
            vim.fn.sign_define('DiagnosticSignError', { text = '', texthl = 'DiagnosticSignError' })
            vim.fn.sign_define('DiagnosticSignWarn', { text = '', texthl = 'DiagnosticSignWarn' })
            vim.fn.sign_define('DiagnosticSignInfo', { text = '', texthl = 'DiagnosticSignInfo' })
            vim.fn.sign_define('DiagnosticSignHint', { text = '', texthl = 'DiagnosticSignHint' })
        end,
    },
}
