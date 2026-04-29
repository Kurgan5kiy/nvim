require("catppuccin").setup({
    custom_highlights = function(colors)
        return {
            NeoTreeNormal = { bg = colors.base },
            NeoTreeNormalNC = { bg = colors.base },
            NeoTreeEndOfBuffer = { fg = colors.base, bg = colors.base },
            NeoTreeWinSeparator = { fg = colors.surface1, bg = colors.base }, 
        }
    end
})

vim.cmd.colorscheme("catppuccin-mocha")
