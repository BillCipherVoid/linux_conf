return {
    -- Поиск по файлам
    {
        'nvim-telescope/telescope.nvim',
        cmd = "Telescope",
        lazy = true,
        dependencies = {
            {'nvim-lua/plenary.nvim'},
            {
                'nvim-telescope/telescope-fzf-native.nvim', 
                dependencies = {"nvim-telescope/telescope.nvim"},
                build = function()
                    vim.fn.system('cd ' .. vim.fn.stdpath('data') .. '/lazy/telescope-fzf-native.nvim && make')
                end,
                opts = {},
                config = function(plugin)
                    require('telescope').load_extension('fzf')      
                end,
            }
        },
        opts = function()
            local actions = require('telescope.actions')

            return {
                defaults = {
                    mappings = {
                        n = {
                            ["q"] = actions.close,
                        },
                    },
                },
            }
        end,
        keys = function()
            local builtin = require('telescope.builtin')
            vim.keymap.set('n', 'gr', builtin.lsp_references, 
                                {noremap = true, silent = true})
            vim.keymap.set('n', 'gd', builtin.lsp_definitions,
                                    {noremap = true, silent = true})
            return {
                -- find
                {"<leader>ff", ":Telescope find_files<CR>", mode = {"n"}, desc="[f]ind files"},
                {'<leader>fg', ':Telescope live_grep<CR>', mode = {"n"}, desc="live [g]rep"},
                { "<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "[r]ecent" },
                {
                    "<leader>fb",
                    "<cmd>Telescope buffers sort_mru=true sort_lastused=true ignore_current_buffer=true<cr>",
                    desc = "Buffers",
                },
            }
        end,
    }, 

    {'m4xshen/autoclose.nvim',  -- Автоматические двойные кавычки, скобки и тп. И работа с ними
        opts = {},
        event = "InsertEnter",
        lazy = true,
    },  
        
    {
        'mattn/emmet-vim', 
        ft = "html",
    },

    {'numToStr/Comment.nvim',  -- Для удобного коментирования
        lazy = true,
        keys = {  -- Для ленивой загрузки
            {'<leader>cc'},
            {'<leader>cb'},
            {'<leader>c', mode="v"},
            {'<leader>b', mode="v"},
        },
        opts = {
            -- Включить/отключить добавление пробела после символа комментария
            padding = true,
            -- Переназначаем ключевые привязки
            toggler = {
                line = '<leader>cc',  -- Закомментировать строку (вместо 'gcc')
                block = '<leader>cb', -- Закомментировать блок (вместо 'gbc')
            },
            opleader = {
                line = '<leader>c',   -- Закомментировать строки в визуальном режиме (вместо 'gc')
                block = '<leader>b',  -- Закомментировать блоки в визуальном режиме (вместо 'gb')
            }
        }
    },  

    { "folke/todo-comments.nvim",  -- Подсветка и работа с TODO
        lazy = true,
        opts = {},
        keys = { -- Для ленивой загрузки
            {'<leader>td', ':TodoTelescope <CR>', desc="TODO"},
        },
    },    

    {
        'Pocco81/auto-save.nvim', 
        opts = {},
        event = "InsertLeave", -- FocusLost  Сохраняет файл при потере фокуса окном NeoVim.
        lazy = true,
    }, -- Автосохранение 
}
