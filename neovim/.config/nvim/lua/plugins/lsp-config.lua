return {
    {
        "VonHeikemen/lsp-zero.nvim",
        branch = "v3.x",
        lazy = true,
        config = false,
    },

    -- LSP
    {
        "williamboman/mason.nvim",
        opts = {
            ui = {
                icons = {
                    package_installed = "",
                    package_pending = "",
                    package_uninstalled = "",
                },
            },
        },
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = { "lua_ls" },
                handlers = {
                    require("lsp-zero").default_setup,
                },
            })
        end,
    },
    {
        "neovim/nvim-lspconfig",
        cmd = "LspInfo",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            local lsp_zero = require("lsp-zero")
            lsp_zero.extend_lspconfig()

            lsp_zero.on_attach(function(client, bufnr)
                lsp_zero.default_keymaps({ buffer = bufnr })

                if client.server_capabilities.documentSymbolProvider then
                    require("nvim-navic").attach(client, bufnr)
                end
            end)

            lsp_zero.set_sign_icons({
                error = "",
                warn = "",
                hint = "󰈻",
                info = "",
            })

            local format_opts = {
                format_opts = {
                    async = false,
                    timeout_ms = 10000,
                },
                servers = {
                    ["clangd"] = {
                        "c",
                        "cpp",
                    },
                    ["null-ls"] = {
                        -- stylua
                        "lua",
                        "luau",

                        -- prettier
                        "javascript",
                        "javascriptreact",
                        "typescript",
                        "typescriptreact",
                        "vue",
                        "css",
                        "scss",
                        "less",
                        "html",
                        "json",
                        "jsonc",
                        "yaml",
                        "markdown",
                        "markdown.mdx",
                        "graphql",
                        "handlebars",

                        -- black
                        "python",
                    },
                },
            }

            lsp_zero.format_mapping("<leader>a", format_opts)
            -- lsp.format_on_save(format_opts)
        end,
    },

    -- Autocompletion
    -- {
    --     "hrsh7th/nvim-cmp",
    --     event = "InsertEnter",
    --     dependencies = {
    --         { "hrsh7th/cmp-path" },
    --         { "hrsh7th/cmp-buffer" },
    --         { "saadparwaiz1/cmp_luasnip" },
    --         { "onsails/lspkind.nvim" },
    --         { "L3MON4D3/LuaSnip" },
    --         { "rafamadriz/friendly-snippets" },
    --     },
    --     config = function()
    --         -- Here is where you configure the autocompletion settings.
    --         -- The arguments for .extend() have the same shape as `manage_nvim_cmp`:
    --         -- https://github.com/VonHeikemen/lsp-zero.nvim/blob/v2.x/doc/md/api-reference.md#manage_nvim_cmp
    --
    --         require("lsp-zero.cmp").extend()
    --         require("luasnip.loaders.from_vscode").lazy_load()
    --
    --         -- And you can configure cmp even more, if you want to.
    --         local cmp = require("cmp")
    --         local cmp_action = require("lsp-zero.cmp").action()
    --
    --         cmp.setup({
    --             window = {
    --                 completion = cmp.config.window.bordered(),
    --                 documentation = cmp.config.window.bordered(),
    --             },
    --             sources = {
    --                 { name = "path" },
    --                 { name = "nvim_lsp" },
    --                 { name = "buffer", keyword_length = 3 },
    --                 { name = "luasnip", keyword_length = 2 },
    --             },
    --             formatting = {
    --                 fields = { "kind", "abbr", "menu" },
    --                 format = require("lspkind").cmp_format({
    --                     mode = "symbol", -- show only symbol annotations
    --                     menu = {
    --                         nvim_lsp = "[LSP]",
    --                         path = "[Path]",
    --                         buffer = "[Buffer]",
    --                         luasnip = "[Snippet]",
    --                     },
    --                     maxwidth = 30, -- prevent the popup from showing more than provided characters
    --                     ellipsis_char = "...", -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead
    --                 }),
    --             },
    --             mapping = {
    --                 ["<CR>"] = cmp.mapping.confirm({ select = false }),
    --                 ["<C-Space>"] = cmp.mapping.complete(),
    --                 ["<C-f>"] = cmp_action.luasnip_jump_forward(),
    --                 ["<C-b>"] = cmp_action.luasnip_jump_backward(),
    --                 ["<Tab>"] = cmp_action.luasnip_supertab(),
    --                 ["<S-Tab>"] = cmp_action.luasnip_shift_supertab(),
    --             },
    --         })
    --     end,
    -- },

    -- NULL-LS
    {
        "nvimtools/none-ls.nvim",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            "jay-babu/mason-null-ls.nvim",
        },
        config = function()
            local null_ls = require("null-ls")
            local formatting = null_ls.builtins.formatting

            null_ls.setup({
                sources = {
                    formatting.stylua,
                    formatting.prettier,
                    formatting.black,
                },
            })

            require("mason-null-ls").setup({
                ensure_installed = nil,
                automatic_installation = true,
            })
        end,
    },

    -- Fidget.nvim
    {},
}
