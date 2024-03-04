return {
    "VonHeikemen/fine-cmdline.nvim",
    dependencies = {
        "MunifTanjim/nui.nvim",
    },
    config = function()
        require("fine-cmdline").setup({
            cmdline = {
                prompt = "> ",
            },
            popup = {
                position = {
                    row = "30%",
                    col = "50%",
                },
                size = {
                    width = "30%",
                },
                border = {
                    style = "rounded",
                    padding = { 1, 2 },
                    text = {
                        top = " CmdLine ",
                        top_align = "center",
                    },
                },
                win_options = {
                    winhighlight = "Normal:Normal,FloatBorder:FloatBorder",
                },
            },
        })
    end,
}
