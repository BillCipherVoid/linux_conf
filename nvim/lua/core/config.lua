vim.opt.mouse = "a" -- Enable mouse support
vim.opt.encoding = "utf-8"       -- Общая кодировка (необязательно, по умолчанию UTF-8)
vim.opt.fileencoding = "utf-8"  -- Кодировка файлов
vim.opt.number = true -- Show line numbers
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


-- Keymaps for programming languages
vim.api.nvim_create_autocmd('FileType', {

    pattern = 'python',
    callback = function()

        vim.opt.colorcolumn = '88'
        vim.keymap.set('n', '<C-h>', ':w<CR>:!python3.11 %<CR>', { buffer = true, silent = true })
        vim.keymap.set('i', '<C-h>', '<Esc>:w<CR>:!python3.11 %<CR>', { buffer = true, silent = true })
    end
})


vim.api.nvim_create_autocmd('FileType', {
    pattern = 'c',
    callback = function()
        vim.keymap.set('n', '<C-h>', ':w<CR>:!gcc % -o out; ./out<CR>', { buffer = true, silent = true })
        vim.keymap.set('i', '<C-h>', '<Esc>:w<CR>:!gcc % -o out; ./out<CR>', { buffer = true, silent = true })
    end
})

vim.api.nvim_create_autocmd('FileType', {
    pattern = {'sh', 'go'},
    callback = function()
        vim.keymap.set('n', '<C-h>', ':w<CR>:!%<CR>', { buffer = true, silent = true })
        vim.keymap.set('i', '<C-h>', '<Esc>:w<CR>:!%<CR>', { buffer = true, silent = true })
    end
})

--

-- Common keymaps
vim.keymap.set('i', 'jk', '<Esc>', { noremap = true })
vim.keymap.set('n', ',<Space>', ':nohlsearch<CR>', { noremap = true })
vim.keymap.set('n', 'H', 'gT', { noremap = true }) -- Переключение вкладок
vim.keymap.set('n', 'L', 'gt', { noremap = true }) vim.keymap.set('n', ',f', ':Telescope find_files<CR>', { noremap = true })
vim.keymap.set('n', ',g', ':Telescope live_grep<CR>', { noremap = true })
vim.keymap.set('n', 'gw', ':bp|bd #<CR>', { noremap = true, silent = true })

