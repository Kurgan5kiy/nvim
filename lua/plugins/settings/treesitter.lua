require("nvim-treesitter").setup({
    ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline", "python" },
    highlight = { enable = true },
})
