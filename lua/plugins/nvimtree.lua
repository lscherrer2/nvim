return {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
        filters = {
            custom = {
                ".egg-info",
                "__pycache__",
            },
        },
    },
    config = function(_, opts)
        require("nvim-tree").setup(opts)
        vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file tree" })
    end,
}
