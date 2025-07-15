local ls = require("luasnip")
local snip_path = vim.fn.stdpath("config") .. "/snippets"
require("luasnip.loaders.from_lua").lazy_load({ paths = snip_path })
-- ваши маппинги для expand/jump
-- vim.keymap.set({"i", "s"}, "<Tab>", function()
vim.keymap.set({"i", "s"}, "<A-j>", function()
    if ls.expand_or_jumpable() then
        ls.expand_or_jump()
    end
end, { silent = true })

-- vim.keymap.set({"i", "s"}, "<S-Tab>", function()
vim.keymap.set({"i", "s"}, "<A-k>", function()
    if ls.jumpable(-1) then
        ls.jump(-1)
    end
end, { silent = true })

require("luasnip").config.set_config({
    history = true,
    updateevents = "TextChanged,TextChangedI"
})
