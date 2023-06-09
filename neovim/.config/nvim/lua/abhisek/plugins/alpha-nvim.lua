return {
    "goolord/alpha-nvim",
    event = "VimEnter",
    opts = function()
        local dashboard = require("alpha.themes.dashboard")

        dashboard.section.buttons.val = {
            dashboard.button("e", "  New file", "<cmd>enew <CR>"),
            dashboard.button("f", "󰈞  Find file", "<cmd>Telescope find_files <CR>"),
            dashboard.button("r", "󰊄  Recently opened files", "<cmd>Telescope oldfiles <CR>"),
            dashboard.button("g", "󰈬  Find word", "<cmd>Telescope live_grep <CR>"),
            dashboard.button("l", "󰒲  Lazy", "<cmd>Lazy <CR>"),
            dashboard.button("q", "  Quit", "<cmd>qa <CR>"),
        }

        dashboard.section.footer.val = " NVIM 0.9.1"

        return dashboard.config
    end,
}
