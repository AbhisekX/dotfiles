return {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = "nvim-tree/nvim-web-devicons",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
        options = {
            offsets = {
                {
                    filetype = "NvimTree",
                    text = "File Explorer",
                    highlight = "PanelHeading",
                },
            },
        },
    },
}
