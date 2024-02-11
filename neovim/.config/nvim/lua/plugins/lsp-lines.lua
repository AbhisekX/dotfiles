return {
    url = "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
    event = "VeryLazy",
    keys = {
        {
            "<leader>l",
            function()
                local virtual_text = vim.diagnostic.config().virtual_text
                vim.diagnostic.config({ virtual_text = not virtual_text })
                require("lsp_lines").toggle()
            end,
            desc = "Toggle lsp_lines",
        },
    },
    config = function(_, opts)
        require("lsp_lines").setup(opts)
        vim.diagnostic.config({ virtual_lines = false })
    end,
    opts = {},
}
