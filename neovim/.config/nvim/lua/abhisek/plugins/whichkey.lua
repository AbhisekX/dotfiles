return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
        vim.o.timeout = true
        vim.o.timeoutlen = 500
    end,
    config = function(_, opts)
        local wk = require("which-key")
        wk.setup(opts)
        wk.register(opts.defaults)
    end,
    opts = {
        defaults = {
            ["g"] = { name = "+goto" },
            ["<leader>b"] = { name = "+buffer" },
            ["<leader>f"] = { name = "+file/find" },
            ["<leader>g"] = { name = "+git" },
            ["<leader>x"] = { name = "+diagnostics/quickfix" },
        },
    },
}
