return {
    {
        "nvim-treesitter/nvim-treesitter",
        event = "BufReadPost", 
        lazy = vim.fn.argc(-1) == 0,
        init = function(plugin)
            require("nvim-treesitter.query_predicates")
        end,
        opts = {
            ensure_installed = {
                "python",
                "javascript",
                "typescript",
                "tsx",
                "css",
                "html",
            },
            highlight = { enable = true },
            rainbow = { enable = true },
        },
        config = function(_, opts)
            require("nvim-treesitter.configs").setup(opts) 
        end,
    } 
}
