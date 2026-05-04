local wk = require("which-key")

wk.setup()

wk.add({
	{ "<leader>b", group = "Buffers" },
	{ "<leader>f", group = "Fuzzy Find" },
	{ "<leader>h", group = "Hop (Motions)" },
	{ "<leader>l", group = "LSP & Linter" },
	{ "<leader>lh", group = "Hover" },
	{ "<leader>g", group = "Go to" },
})
