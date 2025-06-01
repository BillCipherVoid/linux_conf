-- Basic
require("core.config")
require("core.init_plugins")
require("core.keymaps")

-- Plugins
require("plugins.telescope") -- Поиск по файлам
require("plugins.Coment")  -- Коментирование
require("plugins.cmp")  -- Автокомлит
require("plugins.lsp")  -- LSP
require('auto-save').setup() -- Автосохранения 

-- Color scheme
vim.cmd([[colorscheme kanagawa-dragon]]) -- kanagawa-wave, kanagawa-dragon, kanagawa-lotus

-- прозрачный bg  
vim.cmd([[
   highlight Normal guibg=NONE ctermbg=NONE
   highlight NonText guibg=NONE ctermbg=NONE
   highlight LineNr guibg=NONE ctermbg=NONE
   highlight EndOfBuffer guibg=NONE ctermbg=NONE
]])
