return {
    "akinsho/bufferline.nvim",
    version = "*",
    lazy = false,
    dependencies = "nvim-tree/nvim-web-devicons",
    keys = {
        { "[t", "<cmd>BufferLineCyclePrev<cr>", desc = "Previous tab" },
        { "]t", "<cmd>BufferLineCycleNext<cr>", desc = "Next tab" },
    },
    opts = {
        options = {
            offsets = {
                { filetype = "NvimTree" },
            },
        },
    },
}
