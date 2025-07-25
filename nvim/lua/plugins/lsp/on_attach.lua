local function shared_on_attach(client, bufnr)
    -- Быстрые команды для LSP
    local opts = { buffer = bufnr, noremap = true, silent = true }
    -- Замена этих комбинаций в telescope 
    -- vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)  -- Обратная операция gw
    -- vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)

    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
    
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)

    -- vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
    vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
    vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
    vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)
    vim.keymap.set('n', '<space>f', function()
      vim.lsp.buf.format { async = true }
    end, opts)
end

return {
    shared_on_attach = shared_on_attach, 
}
