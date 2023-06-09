return {
    "Wansmer/treesj",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    keys = {
        { "<leader>j", "<cmd>TSJToggle<CR>", desc = "Join Toggle" },
    },
    opts = {
        use_default_keymaps = false,
    },
}
