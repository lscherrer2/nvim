return {
    {
        "CopilotC-Nvim/CopilotChat.nvim",
        dependencies = {
            {
                "zbirenbaum/copilot.lua",
                cmd = "Copilot",
                opts = {
                    suggestion = { enabled = false },
                    panel = { enabled = false },
                },
            },
            { "nvim-lua/plenary.nvim", branch = "master" },
        },
        build = "make tiktoken",
        opts = {
            mappings = {
                reset = { normal = "<leader>zl", insert = "<leader>zl" }, -- remove <C-l>
            },
        },
        keys = {
            {
                "<leader>zc",
                "<cmd>CopilotChatToggle<cr>",
                mode = "n",
                desc = "Open Copilot Chat",
            },
            {
                "<leader>ze",
                "<cmd>CopilotChatExplain<cr>",
                mode = "v",
                desc = "Explain Code with Copilot Chat",
            },
            {
                "<leader>zr",
                "<cmd>CopilotChatReview<cr>",
                mode = "v",
                desc = "Review Code with Copilot Chat",
            },
            {
                "<leader>zf",
                "<cmd>CopilotChatFix<cr>",
                mode = "v",
                desc = "Fix Code with Copilot Chat",
            },
            {
                "<leader>zo",
                "<cmd>CopilotChatOptimize<cr>",
                mode = "v",
                desc = "Optimize Code with Copilot Chat",
            },
            {
                "<leader>zd",
                "<cmd>CopilotChatDocs<cr>",
                mode = "v",
                desc = "Generate Docs with Copilot Chat",
            },
            {
                "<leader>zt",
                "<cmd>CopilotChatTest<cr>",
                mode = "v",
                desc = "Generate Tests with Copilot Chat",
            },
        },
    },
}
