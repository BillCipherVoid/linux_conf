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
    {'nvim-lua/plenary.nvim'}, -- For Telescope plugin
    {'neovim/nvim-lspconfig'}, -- LSP
    {'hrsh7th/nvim-cmp' },-- Autocomplete
    {'hrsh7th/cmp-nvim-lsp'},
    {'L3MON4D3/LuaSnip'},
    {'saadparwaiz1/cmp_luasnip'},
    {'nvim-treesitter/nvim-treesitter' },-- Подсветка синтаксиса
    {"folke/todo-comments.nvim"},    -- Подсветка и работа с TODO
    {'numToStr/Comment.nvim'},  -- Для удобного коментирования
    {'m4xshen/autoclose.nvim'},  -- Автоматические двойные кавычки, скобки и тп. И работа с ними

    -- Поиск по файлам
    {'nvim-telescope/telescope.nvim'}, 
    {'nvim-telescope/telescope-fzf-native.nvim', build = 'make'},
        
    {'Pocco81/auto-save.nvim'}, -- Автосохранение
    {'jose-elias-alvarez/null-ls.nvim'}, -- Форматирование и линтинг
    
    -- Color schemes
    {'morhetz/gruvbox'},
    {'ayu-theme/ayu-vim'},
    {'sainnhe/gruvbox-material'},
    {'rebelot/kanagawa.nvim'},
 
})	
