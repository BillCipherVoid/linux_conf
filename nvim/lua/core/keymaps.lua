
-- Keymaps for programming languages
vim.api.nvim_create_autocmd('FileType', {

    pattern = 'python',
    callback = function()

        vim.opt.colorcolumn = '87'
        vim.keymap.set('n', '<C-h>', ':w<CR>:!python %<CR>', { buffer = true, silent = true })
        vim.keymap.set('i', '<C-h>', '<Esc>:w<CR>:!python %<CR>', { buffer = true, silent = true })
    end
})


vim.api.nvim_create_autocmd('FileType', {
    pattern = 'cpp',
    callback = function()
        vim.keymap.set('n', '<C-h>', ':w<CR>:!gcc % -o out; ./out<CR>', { buffer = true, silent = true })
        vim.keymap.set('i', '<C-h>', '<Esc>:w<CR>:!gcc % -o out; ./out<CR>', { buffer = true, silent = true })
    end
})

--

-- Common keymaps
vim.keymap.set('i', 'jk', '<Esc>', { noremap = true })
vim.keymap.set('n', '<leader><Space>', ':nohlsearch<CR>', { noremap = true })  -- Выключение текущего выделения поиска

-- Переключение вкладок
vim.keymap.set('n', 'H', 'gT', { noremap = true, desc = "Left Tab" }) 
vim.keymap.set('n', 'L', 'gt', { noremap = true, desc = "Right Tab" }) 

vim.keymap.set('n', '<leader>e', ':Texplore $PWD<CR>', { noremap = true, silent = true, desc = "Open Exploer"})

-- Buffer
vim.keymap.set("n", "[b", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
vim.keymap.set("n", "]b", "<cmd>bnext<cr>", { desc = "Next Buffer" })
vim.keymap.set('n', 'gw', ':bp|bd #<CR>', { noremap = true, silent = true, desc = "Close Buffer" })  
vim.keymap.set('n', '<leader>bb', ':b#<CR>', { noremap = true, silent = true, desc = "Back Buffer" })  

-- Windows
vim.keymap.set('n', '<leader>wv', ':vsplit<CR>', { noremap = true, silent = true, desc = "Vertical split"})
vim.keymap.set('n', '<leader>wh', ':split<CR>', { noremap = true, silent = true, desc = "Horizontal split" })
vim.keymap.set('n', '<leader>ww', '<C-w>w', { noremap = true, silent = true, desc = "Next Window" })  

-- Quickfix
vim.keymap.set('n', ']q', ':cnext<CR>', { noremap = true, silent = true, desc = "Next item Quickfix" })  
vim.keymap.set('n', '[q', ':cprevious<CR>', { noremap = true, silent = true, desc = "Prev item Quickfix" })  
vim.keymap.set('n', '<leader>qq', ':cclose<CR>', { noremap = true, silent = true, desc = "Close Quickfix" })  
vim.keymap.set('n', '<leader>qr', ':silent! cbuffer<CR>', { noremap = true, silent = true, desc = "update Quickfix" })  
