return {
    {
        'hrsh7th/nvim-cmp', 
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
        },
        event = "InsertEnter",
        lazy = true,
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
                    { name = 'nvim_lsp', priority = 1},  -- Источник из LSP
                    { name = 'html-css', priority = 2 },  -- Источник из LSP
                    -- { name = 'luasnip' },  -- Источник из LSP
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

            -- lspconfig.typescriptls.setup({
            --     cmd = { "typescript-language-server", "--stdio" },
            --     root_dir = lspconfig.util.root_pattern("package.json", "tsconfig.json", "jsconfig.json", ".git"),
            --     capabilities = capabilities,
            -- })

            lspconfig.cssls.setup({
                cmd = { "css-languageserver", "--stdio" },
                root_dir = lspconfig.util.root_pattern(".git", "package.json", "cssconfig.json"),
                capabilities = capabilities,
            })

            lspconfig.html.setup({
                cmd = { "html-languageserver", "--stdio" },
                root_dir = lspconfig.util.root_pattern(".git", "package.json", "htmlconfig.json"),
                capabilities = capabilities,
            })


            local capabilities = vim.lsp.protocol.make_client_capabilities()
            capabilities.textDocument.completion.completionItem.snippetSupport = true

            -- lspconfig.emmet_ls.setup({
            --     -- cmd = { "emmet-language-server", "--stdio" },
            --     root_dir = require('lspconfig').util.root_pattern(".git", "package.json", "tsconfig.json", "jsconfig.json"),
            --     filetypes = { "html", "typescriptreact", "javascriptreact", "css", "less", "scss", "svelte" },
            --     capabilities = capabilities,
            --     init_options = {
            --         html = {
            --             options = {
            --                 -- For possible options, see: https://github.com/emmetio/emmet/blob/master/src/config.ts#L79-L267
            --                 ["bem.enabled"] = true,
            --             },
            --         },
            --     },
            -- })

        end,
    },


    {
      "Jezda1337/nvim-html-css",
      dependencies = { "hrsh7th/nvim-cmp", "nvim-treesitter/nvim-treesitter" }, 
      lazy = true,
      ft = "html,css",
      opts = {
        enable_on = { -- Example file types
          "html",
          "htmldjango",
          "css",
        },
        handlers = {
          definition = {
            bind = "gd"
          },
          hover = {
            bind = "K",
            wrap = true,
            border = "none",
            position = "cursor",
          },
        },
        documentation = {
          auto_show = true,
        },
        style_sheets = {
          "https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css",
          -- "./index.css", -- `./` refers to the current working directory.
        },
      },
    }
}
