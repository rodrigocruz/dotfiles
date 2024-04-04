return {
    "stevearc/conform.nvim",
    opts = {
        formatters_by_ft = {
            lua = {"stylua"},
            php = {"pint", "prettier"},
            blade = {"blade-formatter"},
            javascript = {"prettier"},
            typescriptreact = {"prettier"},
            json = {"prettier"},
            html = {"prettier"},
            yaml = {"prettier"},
            css = {"prettier"},
        },
        formatters = {
            prettier = {
                prepend_args = {"--tab-width=2"}
            }
        }
    },
}
