require("mason").setup({})

require("mason-tool-installer").setup({
    ensure_installed = {
        "stylua",
    },
    auto_update = true,
    run_on_start = true,
})
