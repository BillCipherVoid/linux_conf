-- Basic
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

    highlight SignColumn guibg=NONE ctermbg=NONE
    highlight DiagnosticSignError guibg=NONE ctermbg=NONE
    highlight DiagnosticSignWarn guibg=NONE ctermbg=NONE
    highlight DiagnosticSignInfo guibg=NONE ctermbg=NONE
    highlight DiagnosticSignHint guibg=NONE ctermbg=NONE


    highlight GitSignsAdd guibg=NONE ctermbg=NONE
    highlight GitSignsChange guibg=NONE ctermbg=NONE
    highlight GitSignsDelete guibg=NONE ctermbg=NONE
]])

