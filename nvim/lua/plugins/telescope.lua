require('telescope').setup()
require('telescope').load_extension('fzf')

local builtin = require('telescope.builtin')

vim.keymap.set('n', 'gr', builtin.lsp_references, 
                    {noremap = true, silent = true})
vim.keymap.set('n', 'gd', builtin.lsp_definitions,
                        {noremap = true, silent = true})

vim.keymap.set('n', ',f', ':Telescope find_files<CR>', { noremap = true })
vim.keymap.set('n', ',g', ':Telescope live_grep<CR>', { noremap = true })


