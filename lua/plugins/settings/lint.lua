local lint = require("lint")

lint.linters_by_ft = {
    nix = { "statix", "deadnix" },
}

vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost", "InsertLeave" }, {
    group = vim.api.nvim_create_augroup("RunLinters", { clear = true }),
    callback = function()
        lint.try_lint()
    end,
})
