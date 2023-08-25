return {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 1000,
    config = function(_, opts)
        require("catppuccin").setup(opts)
        vim.cmd.colorscheme("catppuccin")
    end,
    opts = {
        flavour = "mocha", -- latte, frappe, macchiato, mocha
        background = { -- :h background
            light = "latte",
            dark = "mocha",
        },
        transparent_background = false,
        show_end_of_buffer = false, -- show the '~' characters after the end of buffers
        term_colors = false,
        dim_inactive = {
            enabled = false,
            shade = "dark",
            percentage = 0.15,
        },
        no_italic = false, -- Force no italic
        no_bold = false, -- Force no bold
        styles = {
            comments = { "italic" },
            conditionals = {},
            loops = {},
            functions = {},
            keywords = {},
            strings = {},
            variables = {},
            numbers = {},
            booleans = {},
            properties = {},
            types = {},
            operators = {},
        },
        color_overrides = {
            mocha = {
                base = "#1f1f2a",
            },
        },
        custom_highlights = function(colors)
            return {
                -- Editor
                LineNr = { fg = colors.surface2 },
                CursorLineNr = { fg = colors.peach, bold = true },

                -- Telescope.nvim
                TelescopePromptTitle = { fg = colors.mantle, bg = colors.red, bold = true },
                TelescopePromptNormal = { bg = colors.surface0 },
                TelescopePromptBorder = { fg = colors.surface0, bg = colors.surface0 },

                TelescopeResultsTitle = { fg = colors.mantle, bg = colors.mantle },
                TelescopeResultsNormal = { bg = colors.mantle },
                TelescopeResultsBorder = { fg = colors.mantle, bg = colors.mantle },

                TelescopePreviewTitle = { fg = colors.mantle, bg = colors.blue, bold = true },
                TelescopePreviewNormal = { bg = colors.crust },
                TelescopePreviewBorder = { fg = colors.crust, bg = colors.crust },
            }
        end,
        integrations = {
            alpha = true,
            bufferline = true,
            cmp = true,
            gitsigns = true,
            headlines = true,
            illuminate = true,
            leap = true,
            markdown = true,
            mason = true,
            neogit = true,
            nvimtree = true,
            symbols_outline = true,
            telescope = true,
            treesitter = true,
            which_key = true,
            -- barbecue = {
            --     dim_dirname = true,
            --     bold_basename = true,
            --     dim_context = false,
            --     alt_background = false,
            -- },
            indent_blankline = {
                enabled = true,
                colored_indent_levels = true,
            },
            navic = {
                enabled = false,
                custom_bg = "NONE",
            },
            -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
        },
    },
}
