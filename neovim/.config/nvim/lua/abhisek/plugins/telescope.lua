return {
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.1",
        dependencies = {
            "nvim-lua/plenary.nvim",
            { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
        },
        event = "VeryLazy",
        keys = function()
            local builtin = require("telescope.builtin")
            return {
                { "<leader>ff", builtin.find_files, desc = "Find Files" },
                { "<leader>fr", builtin.oldfiles, desc = "Recently Opened" },
                { "<leader>fg", builtin.live_grep, desc = "Grep String" },
                { "<leader>fb", builtin.buffers, desc = "Open Buffers" },
                { "<leader>fh", builtin.help_tags, desc = "Help Tags" },
                {
                    "<leader>fd",
                    "<cmd>Telescope file_browser path=%:p:h select_buffer=true<CR>",
                    desc = "File Browser",
                },
                { "<leader>fy", "<cmd>Telescope yank_history<CR>", desc = "Yank History" },
            }
        end,
        config = function(_, opts)
            local telescope = require("telescope")
            telescope.setup(opts)
            telescope.load_extension("fzf")
            telescope.load_extension("ui-select")
            telescope.load_extension("file_browser")
            telescope.load_extension("yank_history")
        end,
        opts = {
            defaults = {
                prompt_prefix = "  ",
                selection_caret = "  ",
                borderchars = { " ", " ", " ", " ", " ", " ", " ", " " },
                sorting_strategy = "ascending",
                layout_config = {
                    horizontal = {
                        prompt_position = "top",
                    },
                },
            },
            extensions = {
                fzf = {
                    fuzzy = true,
                    override_generic_sorter = true,
                    override_file_sorter = true,
                    case_mode = "smart_case",
                },
                ["ui-select"] = {},
                file_browser = {},
            },
        },
    },
    {
        "nvim-telescope/telescope-ui-select.nvim",
        event = "VeryLazy",
    },
    {
        "nvim-telescope/telescope-file-browser.nvim",
        dependencies = {
            "nvim-telescope/telescope.nvim",
            "nvim-lua/plenary.nvim",
        },
        event = "VeryLazy",
    },
}
