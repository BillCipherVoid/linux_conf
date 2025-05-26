-- Basic
require("core.config")
require("core.plugins")

-- Color scheme
vim.cmd([[colorscheme kanagawa-dragon]]) -- kanagawa-wave, kanagawa-dragon, kanagawa-lotus

--Plugins
require("plugins.lsp")
require("plugins.luasnip")
require("plugins.cmp")

--Auto-Save
require('auto-save').setup()

-- прозрачный bg  
vim.cmd([[
   highlight Normal guibg=NONE ctermbg=NONE
   highlight NonText guibg=NONE ctermbg=NONE
   highlight LineNr guibg=NONE ctermbg=NONE
   highlight EndOfBuffer guibg=NONE ctermbg=NONE
]])

