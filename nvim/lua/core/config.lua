vim.opt.mouse = "a" -- Enable mouse support
vim.opt.encoding = "utf-8"       -- Общая кодировка (необязательно, по умолчанию UTF-8)
vim.opt.fileencoding = "utf-8"  -- Кодировка файлов
vim.opt.number = true -- Show line numbers
vim.opt.relativenumber = true  -- Относительно курсора номер строки
vim.opt.cursorline = false -- Disable highlight current cursor's line
vim.opt.swapfile = false -- Disable .swp files 
vim.opt.scrolloff = 7 -- Number of lines left visible above/below the cursor when scrolling
vim.opt.tabstop = 4 -- Spaces instead of one tab
vim.opt.softtabstop = 4 -- Spaces instead of one tab
vim.opt.shiftwidth = 4 -- Spaces for auto indent
vim.opt.expandtab = true -- Replace tab with spaces
vim.opt.autoindent = true -- Save indent on new line
vim.opt.fileformat = "unix"
vim.opt.smartindent = true
vim.opt.splitbelow = true -- horizontal split open below and right
vim.opt.splitright = true
vim.g.mapleader = ',' -- Leader key
vim.opt.termguicolors = true -- 24-bit colors


-- netrw файловый менеджер 
vim.g.netrw_banner = 0 -- Скрывает банер о файле
vim.g.netrw_liststyle = 3 -- Показывает дерево файлов
vim.g.netrw_browse_split = 3 -- Вместо того чтобы нажимать t можно нажать enter


