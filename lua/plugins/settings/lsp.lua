require("mason-lspconfig").setup({
    ensure_installed = { "ruff", "ty", "lua_ls", "stylua" }
})

local capabilities = require('cmp_nvim_lsp').default_capabilities()

vim.lsp.config("ruff", { 
    capabilities = capabilities 
})
vim.lsp.enable("ruff")
vim.lsp.config("ty", {
    cmd = { "ty", "server" },
    filetypes = { "python" },
    root_markers = { "ty.toml", "pyproject.toml", "setup.py", ".git" },
    capabilities = capabilities,
})
vim.lsp.enable("ty")
vim.lsp.config("lua_ls", {
    capabilities = capabilities,
    settings = {
        Lua = {
            diagnostics = { globals = { "vim" } }
        }
    }
})
vim.lsp.enable("lua_ls")
