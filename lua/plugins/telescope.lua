return {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        local telescope = require("telescope")
        local builtin = require("telescope.builtin")
        
        telescope.setup({
            defaults = {
                file_ignore_patterns = {
                    "^.git/",
                    "^node_modules/",
                    "^__pycache__/",
                    "^%.cache/",
                    "^%.venv/",
                    "^venv/",
                    "^%.npm/",
                    "^%.yarn/",
                },
            },
            pickers = {
                find_files = {
                    hidden = true,
                },
                live_grep = {
                    additional_args = function()
                        return { "--hidden" }
                    end,
                },
            },
        })
        
        vim.keymap.set(
            "n",
            "<leader>ff",
            builtin.find_files,
            { desc = "Find files" }
        )
        vim.keymap.set(
            "n",
            "<leader>fg",
            builtin.live_grep,
            { desc = "Live grep" }
        )
        vim.keymap.set(
            "n",
            "<leader>fb",
            builtin.buffers,
            { desc = "Find buffers" }
        )
        vim.keymap.set(
            "n",
            "<leader>fh",
            builtin.help_tags,
            { desc = "Help tags" }
        )
    end,
}
