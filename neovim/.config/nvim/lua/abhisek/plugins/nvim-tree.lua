return {
    "nvim-tree/nvim-tree.lua",
    event = "VeryLazy",
    keys = {
        { "<leader>e", "<cmd>NvimTreeFindFileToggle<CR>", desc = "NvimTree Toggle" },
    },
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {},
}
