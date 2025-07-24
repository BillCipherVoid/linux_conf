return {
    -- Поиск по файлам
    {
        'nvim-telescope/telescope.nvim',
        dependencies = {'nvim-lua/plenary.nvim'},
        keys = function()
            local builtin = require('telescope.builtin')

            -- vim.keymap.set('n', 'gr', builtin.lsp_references, 
            --                     {noremap = true, silent = true})
            -- vim.keymap.set('n', 'gd', builtin.lsp_definitions,
            --                         {noremap = true, silent = true})
            return {
                {"<leader>f", ":Telescope find_files<CR>", mode = {"n"}},
                {'<leader>g', ':Telescope live_grep<CR>', mode = {"n"}},
            }
        end,
    }, 
    {
        'nvim-telescope/telescope-fzf-native.nvim', 
        dependencies = {"nvim-telescope/telescope.nvim"},
        build = 'make' or 'cd ~/.local/share/nvim/lazy/telescope-fzf-native.nvim && make',
        opts = {},
        config = function(plugin)
            require('telescope').load_extension('fzf')      
        end,
    },


    {'m4xshen/autoclose.nvim',  -- Автоматические двойные кавычки, скобки и тп. И работа с ними
        opts = {},
    },  
        
    {
        'mattn/emmet-vim', 
    },

    {'numToStr/Comment.nvim',  -- Для удобного коментирования
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
        keys = {
            {'<leader>td', ':TodoTelescope <CR>', desc="TODO"},
        },
    },    

    {'Pocco81/auto-save.nvim', opts = {}}, -- Автосохранение 
}
