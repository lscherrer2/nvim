return {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    lazy = true,
    keys = {
        { "<leader>e", "<cmd>NvimTreeToggle<CR>", desc = "Toggle file tree" },
    },
    opts = {
        filters = {
            dotfiles = false,
            git_ignored = false,
            custom = {
                ".egg-info",
                "__pycache__",
            },
        },
        view = {
            signcolumn = "no",
        },
    },
    config = function(_, opts)
        require("nvim-tree").setup(opts)
        local api = require("nvim-tree.api")
        api.events.subscribe(api.events.Event.TreeOpen, function()
            local bufnr = vim.api.nvim_get_current_buf()
            if vim.bo[bufnr].filetype == "NvimTree" then
                vim.wo[0].fillchars = "eob: "
            end
        end)
    end,
}
