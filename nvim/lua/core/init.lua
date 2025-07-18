require("core.config")
require("core.lazy")
require("core.keymaps")

-- Color scheme
vim.cmd([[colorscheme kanagawa-dragon]]) -- kanagawa-wave, kanagawa-dragon, kanagawa-lotus

-- прозрачный bg  
vim.cmd([[
   highlight Normal guibg=NONE ctermbg=NONE
   highlight NonText guibg=NONE ctermbg=NONE
   highlight LineNr guibg=NONE ctermbg=NONE
   highlight EndOfBuffer guibg=NONE ctermbg=NONE
]])
