return {
    "anuvyklack/hydra.nvim",
    event = "VeryLazy",
    config = function(_, _)
        local Hydra = require("hydra")

        Hydra({
            name = "Change / Resize Window",
            mode = "n",
            body = "<C-w>",
            heads = {
                -- Move between windows
                { "h", "<C-w>h" },
                { "j", "<C-w>j" },
                { "k", "<C-w>k" },
                { "l", "<C-w>l", { desc = "/" } },

                -- Resizing window
                { "K", "<C-w>+" },
                { "J", "<C-w>-" },
                { "H", "<C-w><" },
                { "L", "<C-w>>", { desc = "+/- height/width" } },

                -- Equalize window sizes
                { "=", "<C-w>=" },
            },
        })
    end,
}
