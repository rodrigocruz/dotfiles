return {
    "Wansmer/treesj",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    keys = {
        {
            "gT",
            function()
                require("treesj").toggle()
            end,
        },
        {
            "gJ",
            function()
                require("treesj").join()
            end,
        },
        {
            "gS",
            function()
                require("treesj").split()
            end,
        },
    },
    opts = {
        use_default_keymaps = false,
    },
}
