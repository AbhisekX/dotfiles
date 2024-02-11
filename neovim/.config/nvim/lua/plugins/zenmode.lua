return {
    {
        "folke/zen-mode.nvim",
        event = { "BufReadPost", "BufNewFile" },
        opts = {},
    },
    {
        "folke/twilight.nvim",
        cmd = "ZenMode",
        opts = {},
    },
}
