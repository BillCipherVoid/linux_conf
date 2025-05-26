local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ 
		"git", 
		"clone", 
		"--filter=blob:none", 
		"--branch=stable", 
		lazyrepo, 
		lazypath 
	})

	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end

vim.opt.rtp:prepend(lazypath)


require("lazy").setup({
	{
      'L3MON4D3/LuaSnip',
      config = function()
        local ls = require("luasnip")
        local snip_path = vim.fn.stdpath("config") .. "/snippets"
        require("luasnip.loaders.from_lua").lazy_load({ paths = snip_path })

        -- ваши маппинги для expand/jump
        vim.keymap.set({"i", "s"}, "<Tab>", function()
          if ls.expand_or_jumpable() then
            ls.expand_or_jump()
          end
        end, { silent = true })

        vim.keymap.set({"i", "s"}, "<S-Tab>", function()
          if ls.jumpable(-1) then
            ls.jump(-1)
          end
        end, { silent = true })

      end
    },

    {'nvim-lua/plenary.nvim'}, -- For Telescope plugin
    {'neovim/nvim-lspconfig'}, -- LSP
    {'hrsh7th/nvim-cmp' },-- Autocomplete
    {'hrsh7th/cmp-nvim-lsp'},
    {'saadparwaiz1/cmp_luasnip'},
    {'nvim-treesitter/nvim-treesitter' },-- Подсветка синтаксиса
    

    -- Color schemes
    {'morhetz/gruvbox'},
    {'ayu-theme/ayu-vim'},
    {'sainnhe/gruvbox-material'},
    {'rebelot/kanagawa.nvim'},
    {'numToStr/Comment.nvim',
      config = function()
        require('Comment').setup({
            -- Включить/отключить добавление пробела после символа комментария
            padding = true,
            -- Переназначаем ключевые привязки
            toggler = {
                line = ',cc',  -- Закомментировать строку (вместо 'gcc')
                block = ',cb', -- Закомментировать блок (вместо 'gbc')
            },
            opleader = {
                line = ',c',   -- Закомментировать строки в визуальном режиме (вместо 'gc')
                block = ',b',  -- Закомментировать блоки в визуальном режиме (вместо 'gb')
            },
        })
      end
    },

    {'nvim-telescope/telescope.nvim'},
    {'nvim-telescope/telescope-fzf-native.nvim'},
    {'Pocco81/auto-save.nvim'}, -- Автосохранение
    {'jose-elias-alvarez/null-ls.nvim'}, -- Форматирование и линтинг
})
