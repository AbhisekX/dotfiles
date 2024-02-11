return {
    "rebelot/kanagawa.nvim",
    lazy = false,
    priority = 1000,
    config = function(_, opts)
        require("kanagawa").setup(opts)

        -- vim.cmd.colorscheme("kanagawa")
    end,
    opts = {
        compile = true,
        undercurl = true,
        commentStyle = { italic = true },
        functionStyle = {},
        keywordStyle = { italic = false },
        statementStyle = { bold = false },
        typeStyle = {},
        transparent = false,
        dimInactive = false,
        terminalColors = true,
        colors = {
            palette = {},
            theme = {
                wave = {},
                lotus = {},
                dragon = {},
                all = {
                    ui = { bg_gutter = "none" },
                },
            },
        },
        overrides = function(colors)
            local theme = colors.theme
            local palette = colors.palette
            return {
                NormalDark = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m3 },
                LazyNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
                MasonNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },

                -- Telescope.nvim
                TelescopePromptTitle = { fg = theme.ui.bg_dim, bg = palette.peachRed, bold = true },
                TelescopePromptNormal = { bg = theme.ui.bg_p1 },
                TelescopePromptBorder = { fg = theme.ui.bg_p1, bg = theme.ui.bg_p1 },

                TelescopeResultsTitle = { fg = theme.ui.bg_m1, bg = theme.ui.bg_m1 },
                TelescopeResultsNormal = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m1 },
                TelescopeResultsBorder = { fg = theme.ui.bg_m1, bg = theme.ui.bg_m1 },

                TelescopePreviewTitle = { fg = theme.ui.bg_dim, bg = palette.springBlue, bold = true },
                TelescopePreviewNormal = { bg = theme.ui.bg_dim },
                TelescopePreviewBorder = { bg = theme.ui.bg_dim, fg = theme.ui.bg_dim },

                -- Popup menu
                Pmenu = { fg = theme.ui.shade0, bg = theme.ui.bg_p1 }, -- add `blend = vim.o.pumblend` to enable transparency
                PmenuSel = { fg = "NONE", bg = theme.ui.bg_p2 },
                PmenuSbar = { bg = theme.ui.bg_m1 },
                PmenuThumb = { bg = theme.ui.bg_p2 },

                -- Illuminate.nvim
                IlluminatedWordText = { bg = palette.sumiInk5 },
                IlluminatedWordRead = { bg = palette.sumiInk5 },
                IlluminatedWordWrite = { bg = palette.sumiInk5 },
            }
        end,
        theme = "wave",
        background = {
            dark = "wave",
            light = "lotus",
        },
    },
}
