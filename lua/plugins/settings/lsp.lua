require("mason-lspconfig").setup({
    ensure_installed = { "ruff", "ty", "lua_ls" }
})

local lspconfig = require("lspconfig")

-- Broadcast completion capabilities to the servers
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- Setup Ruff
lspconfig.ruff.setup({ capabilities = capabilities })

lspconfig.ty.setup({ capabilities = capabilities })

lspconfig.lua_ls.setup({
    capabilities = capabilities,
    settings = {
        Lua = {
            diagnostics = { globals = { "vim" } }
        }
    }
})
