return {
    "nvimtools/none-ls.nvim",
    config = function()
        local null_ls = require("null-ls")
        null_ls.setup({
            sources = {
                null_ls.builtins.formatting.stylua,
                null_ls.builtins.formatting.prettier,
                null_ls.builtins.formatting.blade_formatter,
                -- null_ls.builtins.diagnostics.eslint_d.with({
                --     condition = function(utils)
                --         return utils.root_has_file({ ".eslintrc.js" })
                --     end,
                -- }),
                -- null_ls.builtins.diagnostics.phpstan, -- TODO: Only if config file
                null_ls.builtins.diagnostics.trail_space.with({ disabled_filetypes = { "NvimTree" } }),
                -- null_ls.builtins.formatting.eslint_d.with({
                --     condition = function(utils)
                --         return utils.root_has_file({ ".eslintrc.js", ".eslintrc.json" })
                --     end,
                -- }),
                null_ls.builtins.formatting.pint.with({
                    condition = function(utils)
                        return utils.root_has_file({ "vendor/bin/pint" })
                    end,
                }),
                null_ls.builtins.formatting.prettier.with({
                    condition = function(utils)
                        return utils.root_has_file({
                            ".prettierrc",
                            ".prettierrc.json",
                            ".prettierrc.yml",
                            ".prettierrc.js",
                            "prettier.config.js",
                        })
                    end,
                }),
            },
        })

        -- vim.keymap.set("n", "<leader>cf", vim.lsp.buf.format, {})
    end,
}
