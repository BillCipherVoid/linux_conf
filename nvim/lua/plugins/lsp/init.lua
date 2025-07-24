return {
    {'jose-elias-alvarez/null-ls.nvim'}, -- Форматирование и линтинг

    {
        "hrsh7th/cmp-nvim-lsp", 
        opts = {},
        dependencies = {"neovim/nvim-lspconfig"},
    },


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
                    { name = 'html-css' },  -- Источник из LSP
                }),
            }
        end,
    },-- Autocomplete

    {
        'neovim/nvim-lspconfig',
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "neovim/nvim-cmp",
            "jose-elias-alvarez/null-ls.nvim",
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
    {
      "Jezda1337/nvim-html-css",
      dependencies = { "hrsh7th/nvim-cmp", "nvim-treesitter/nvim-treesitter" }, -- Use this if you're using nvim-cmp
      opts = {
        enable_on = { -- Example file types
          "html",
          "htmldjango",
          "tsx",
          "jsx",
          "erb",
          "svelte",
          "vue",
          "blade",
          "php",
          "templ",
          "astro",
        },
        -- handlers = {
        --   definition = {
        --     bind = "gd"
        --   },
        --   hover = {
        --     bind = "K",
        --     wrap = true,
        --     border = "none",
        --     position = "cursor",
        --   },
        -- },
        -- documentation = {
        --   auto_show = true,
        -- },
        style_sheets = {
          "https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css",
          "https://cdnjs.cloudflare.com/ajax/libs/bulma/1.0.3/css/bulma.min.css",
          "./index.css", -- `./` refers to the current working directory.
        },
      },

    },
}
