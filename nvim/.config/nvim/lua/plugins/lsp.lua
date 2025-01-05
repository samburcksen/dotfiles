return {
    'VonHeikemen/lsp-zero.nvim',

    dependencies = {
        { 'williamboman/mason.nvim' },
        { 'williamboman/mason-lspconfig.nvim' },

        { 'neovim/nvim-lspconfig' },
        { 'hrsh7th/nvim-cmp' },
        { 'hrsh7th/cmp-nvim-lsp' },
        { 'L3MON4D3/LuaSnip' },
    },

    config = function()
        local lsp_zero = require('lsp-zero')
        lsp_zero.on_attach(function(client, bufnr)
            -- see :help lsp-zero-keybindings
            -- to learn the available actions
            lsp_zero.default_keymaps({ buffer = bufnr })

            -- Format on save
            lsp_zero.buffer_autoformat()

            -- Format keybind
            vim.keymap.set({ 'n', 'x' }, 'gf', function()
                vim.lsp.buf.format({ async = false, timeout_ms = 10000 })
            end, { buffer = bufnr, desc = "Auto-Format" })
        end)

        -- Lsp configuration
        require('mason').setup({})
        require('mason-lspconfig').setup({
            ensure_installed = {
                'rust_analyzer',
                'lua_ls',
                'clangd',
            },
            handlers = {
                function(server_name)
                    require('lspconfig')[server_name].setup({})
                end,

                lua_ls = function()
                    require('lspconfig').lua_ls.setup({
                        settings = {
                            Lua = {
                                diagnostics = {
                                    globals = { 'vim' }
                                }
                            }
                        },
                    })
                end,

                clangd = function()
                    require('lspconfig').clangd.setup({
                        cmd = {
                            "clangd",
                            "--fallback-style=webkit"
                        }
                    })
                end,

            }
        })

        -- Autocompletion
        local cmp = require('cmp')
        cmp.setup({
            sources = {
                { name = "nvim_lsp" },
                { name = "path" },
                { name = "buffer" },
            },

            mapping = cmp.mapping.preset.insert({
                ["<C-Space>"] = cmp.mapping.complete(),
                --['<CR>'] = cmp.mapping.confirm({ select = true }),
            }),

            -- Start completion with first item already preselect
            preselect = 'item',
            completion = {
                completeopt = 'menu,menuone,noinsert'
            },

        })
    end,
}
