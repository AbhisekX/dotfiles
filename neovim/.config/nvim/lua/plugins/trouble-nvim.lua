return {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    cmd = { "TroubleToggle", "Trouble" },
    keys = {
        { "<leader>xx", "<cmd>TroubleToggle<CR>", desc = "Trouble Toggle" },
        { "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<CR>", desc = "Workspace Diagnostics" },
        { "<leader>xd", "<cmd>TroubleToggle document_diagnostics<CR>", desc = "Document Diagnostics" },
        { "<leader>xl", "<cmd>TroubleToggle loclist<CR>", desc = "Loclist" },
        { "<leader>xq", "<cmd>TroubleToggle quickfix<CR>", desc = "Quickfix" },
    },
    opts = {},
}
