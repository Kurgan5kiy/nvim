local wk = require("which-key")

wk.setup()

wk.add({
	{ "<leader>l", group = "LSP & Linter" },
	{ "<leader>lh", group = "Hover" },
	{ "<leader>g", group = "Go to" },
})
