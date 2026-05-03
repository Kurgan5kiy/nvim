local colors = require("catppuccin.palettes").get_palette("mocha")

local highlights = require("catppuccin.special.bufferline").get_theme()

if type(highlights) == "function" then
    highlights = highlights()
end

if highlights and highlights.fill then
    highlights.fill.bg = colors.base
end

require("bufferline").setup({
    options = {
        diagnostics = "nvim_lsp", 
        always_show_bufferline = true,
    },
    highlights = highlights
})
