require("todo-comments.").setup()

vim.keymap.set('n', ',td', ':TodoTelescope <CR>', { noremap = true, silent = true })
