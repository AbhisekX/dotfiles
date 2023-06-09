return {
    {
        "VonHeikemen/lsp-zero.nvim",
        branch = "v2.x",
        lazy = true,
        config = function()
            -- This is where you modify the settings for lsp-zero
            -- Note: autocompletion settings will not take effect

            require("lsp-zero.settings").preset({})
        end,
    },

    -- Autocompletion
    {
        "hrsh7th/nvim-cmp",
        event = "InsertEnter",
        dependencies = {
            { "hrsh7th/cmp-path" },
            { "hrsh7th/cmp-buffer" },
            { "saadparwaiz1/cmp_luasnip" },
            { "onsails/lspkind.nvim" },
            { "L3MON4D3/LuaSnip" },
            { "rafamadriz/friendly-snippets" },
        },
        config = function()
            -- Here is where you configure the autocompletion settings.
            -- The arguments for .extend() have the same shape as `manage_nvim_cmp`:
            -- https://github.com/VonHeikemen/lsp-zero.nvim/blob/v2.x/doc/md/api-reference.md#manage_nvim_cmp

            require("lsp-zero.cmp").extend()
            require("luasnip.loaders.from_vscode").lazy_load()

            -- And you can configure cmp even more, if you want to.
            local cmp = require("cmp")
            local cmp_action = require("lsp-zero.cmp").action()

            cmp.setup({
                window = {
                    completion = cmp.config.window.bordered(),
                    documentation = cmp.config.window.bordered(),
                },
                sources = {
                    { name = "path" },
                    { name = "nvim_lsp" },
                    { name = "buffer", keyword_length = 3 },
                    { name = "luasnip", keyword_length = 2 },
                },
                formatting = {
                    fields = { "kind", "abbr", "menu" },
                    format = require("lspkind").cmp_format({
                        mode = "symbol", -- show only symbol annotations
                        menu = {
                            nvim_lsp = "[LSP]",
                            path = "[Path]",
                            buffer = "[Buffer]",
                            luasnip = "[Snippet]",
                        },
                        maxwidth = 30, -- prevent the popup from showing more than provided characters
                        ellipsis_char = "...", -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead
                    }),
                },
                mapping = {
                    ["<CR>"] = cmp.mapping.confirm({ select = false }),
                    ["<C-Space>"] = cmp.mapping.complete(),
                    ["<C-f>"] = cmp_action.luasnip_jump_forward(),
                    ["<C-b>"] = cmp_action.luasnip_jump_backward(),
                    ["<Tab>"] = cmp_action.luasnip_supertab(),
                    ["<S-Tab>"] = cmp_action.luasnip_shift_supertab(),
                },
            })
        end,
    },

    -- LSP
    {
        "neovim/nvim-lspconfig",
        cmd = "LspInfo",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            { "hrsh7th/cmp-nvim-lsp" },
            { "williamboman/mason-lspconfig.nvim" },
            {
                "williamboman/mason.nvim",
                build = function()
                    pcall(vim.cmd, "MasonUpdate")
                end,
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
        },
        config = function()
            -- This is where all the LSP shenanigans will live

            local lsp = require("lsp-zero")

            lsp.on_attach(function(client, bufnr)
                lsp.default_keymaps({ buffer = bufnr })

                if client.server_capabilities.documentSymbolProvider then
                    require("nvim-navic").attach(client, bufnr)
                end
            end)

            lsp.set_sign_icons({
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

            lsp.format_mapping("<leader>a", format_opts)
            lsp.format_on_save(format_opts)

            -- (Optional) Configure lua language server for neovim
            require("lspconfig").lua_ls.setup(lsp.nvim_lua_ls())

            lsp.setup()
        end,
    },

    -- NULL-LS
    {
        "jose-elias-alvarez/null-ls.nvim",
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
    {
        "j-hui/fidget.nvim",
        event = { "BufReadPost" },
        opts = {},
    },
}
