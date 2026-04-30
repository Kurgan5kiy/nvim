require("mason-lspconfig").setup({
    ensure_installed = { "ruff", "ty", "lua_ls" }
})

local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- Python: Ruff
vim.lsp.config("ruff", { 
    capabilities = capabilities 
})
vim.lsp.enable("ruff")

-- Python: Ty
vim.lsp.config("ty", {
    cmd = { "ty", "server" },
    filetypes = { "python" },
    root_markers = { "ty.toml", "pyproject.toml", "setup.py", ".git" },
    capabilities = capabilities,
})
vim.lsp.enable("ty")

-- Lua: lua_ls
vim.lsp.config("lua_ls", {
    capabilities = capabilities,
    settings = {
        Lua = {
            diagnostics = { globals = { "vim" } }
        }
    }
})
vim.lsp.enable("lua_ls")

-- Nix: nixd 
vim.lsp.config("nixd", {
    capabilities = capabilities,
    settings = {
        nixd = {
            formatting = {
                command = { "nixfmt" },
            },
        },
    },
})
vim.lsp.enable("nixd")
