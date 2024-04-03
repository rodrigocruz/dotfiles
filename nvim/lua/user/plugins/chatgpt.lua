return {
    "jackMort/ChatGPT.nvim",
    event = "VeryLazy",
    config = function()
        require("chatgpt").setup({
            api_key_cmd = "echo $OPENAI_API_KEY",
            predefined_chat_gpt_prompts = "https://raw.githubusercontent.com/rodrigocruz/custom-gpt-prompts/main/prompts.csv",
            openai_params = {
                model = "gpt-4",
                frequency_penalty = 0,
                presence_penalty = 0,
                max_tokens = 400,
                temperature = 0,
                top_p = 1,
                n = 1,
            },
        })
    end,
    dependencies = {
        "MunifTanjim/nui.nvim",
        "nvim-lua/plenary.nvim",
        "folke/trouble.nvim",
        "nvim-telescope/telescope.nvim",
    },
}
