return {
    {
        'hrsh7th/nvim-cmp', 
        dependencies = {"hrsh7th/cmp-nvim-lsp"},

        opts = function()
            local cmp = require('cmp')
            return {
                diagnostics = {
                    underline = true,
                    update_in_insert = false,
                    signs = true, 
                    severity_sort = true,
                    virtual_text = {
                        spacing = 4,
                        source = "if_many",
                        prefix = '●',
                    },
                },
                completion = {
                    autocomplete =false, -- Отключить автоматическое появление, так как сильно грузит Vim
                },
                mapping = {
                    ['<C-Space>'] = cmp.mapping.complete(), -- Вызов меню автокомплита
                    ['<C-e>'] = cmp.mapping.abort(), -- Закрыть меню
                    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Подтвердить выбор
                    ['<C-p>'] = cmp.mapping.select_prev_item(), -- Навигация вверх
                    ['<C-n>'] = cmp.mapping.select_next_item(), -- Навигация вниз
                },
                sources = cmp.config.sources({
                    { name = 'nvim_lsp' },  -- Источник из LSP
                }),
            }
        end,
    },-- Autocomplete

    {
        'neovim/nvim-lspconfig',
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "nvim-treesitter/nvim-treesitter",
                },
            config = function()
            -- LSP
            local lspconfig = require('lspconfig')
            local capabilities = require('cmp_nvim_lsp').default_capabilities()
            local on_attach = require("plugins.lsp.on_attach").shared_on_attach 

            -- Настройка LSP для Python (Pyright)
            lspconfig.pyright.setup({
                capabilities = capabilities,
                on_attach = on_attach,
                settings = {
                    python = {
                        analysis = {
                            autoSearchPaths = true,
                            useLibraryCodeForTypes = true,
                            diagnosticMode = "workspace",
                        },
                    },
                },
            })
        end,
    },
}
