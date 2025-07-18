return {
    {'jose-elias-alvarez/null-ls.nvim'}, -- Форматирование и линтинг

    {"hrsh7th/cmp-nvim-lsp", opts = {}},

    {
        'hrsh7th/nvim-cmp', 
        dependencies = {"hrsh7th/cmp-nvim-lsp", opts = {}},
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
        dependencies = {"hrsh7th/cmp-nvim-lsp",},
        config = function()
            -- LSP
            local lspconfig = require('lspconfig')
            local capabilities = require('cmp_nvim_lsp').default_capabilities()
            local on_attach = function(client, bufnr)
                -- Быстрые команды для LSP
                local opts = { buffer = bufnr, noremap = true, silent = true }
                -- Замена этих комбинаций в telescope 
                --vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)  -- Обратная операция gw
                --vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)

                vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
                vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
                
                vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)

                -- vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
                vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, opts)
                vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
                vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
                vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
                vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)
                vim.keymap.set('n', '<space>f', function()
                  vim.lsp.buf.format { async = true }
                end, opts)
            end

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


            -- Null-ls для Prettier
            local null_ls = require('null-ls')
            require('null-ls').setup({
                sources = {
                    null_ls.builtins.diagnostics.eslint,
                    null_ls.builtins.code_actions.eslint,   
                    null_ls.builtins.formatting.prettier,
                },
                on_attach = on_attach
            })
        end,
    },
}
