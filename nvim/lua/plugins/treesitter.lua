return {
    {
        "nvim-treesitter/nvim-treesitter",
        -- event = { "LazyFile", "VeryLazy" },
        lazy = vim.fn.argc(-1) == 0,
        init = function(plugin)
            require("nvim-treesitter.query_predicates")
        end,
        opts = {
            ensure_installed = {
                "bash",
                "c",
                "diff",
                "html",
                "css",
                "javascript",
                "jsdoc",
                "json",
                "jsonc",
                "lua",
                "luadoc",
                "luap",
                "markdown",
                "markdown_inline",
                "printf",
                "python",
                "query",
                "regex",
                "toml",
                "tsx",
                "vim",
                "vimdoc",
                "xml",
                "yaml",
                },
            highlight = { enable = true },
        },
        config = function(_, opts)
            require("nvim-treesitter.configs").setup(opts) 
        end,
    } 
}
