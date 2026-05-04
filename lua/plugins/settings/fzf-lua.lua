require("fzf-lua").setup()

-- Native hack to give fzf-lua a "Telescope-like" normal mode
vim.api.nvim_create_autocmd("FileType", {
	pattern = "fzf",
	callback = function(opts)
		local buf = opts.buf
		
		-- j and k will instantly hop into terminal mode, hit the arrow key, and hop out
		vim.keymap.set("n", "j", "i<Down><C-\\><C-n>", { buffer = buf, silent = true, desc = "FZF Down" })
		vim.keymap.set("n", "k", "i<Up><C-\\><C-n>", { buffer = buf, silent = true, desc = "FZF Up" })
		
		-- Enter will instantly accept the currently highlighted search result
		vim.keymap.set("n", "<CR>", "i<CR>", { buffer = buf, silent = true, desc = "FZF Accept" })
		
		-- 'q' or 'Esc' will gracefully close the search window
		vim.keymap.set("n", "q", "i<Esc>", { buffer = buf, silent = true, desc = "FZF Quit" })
		vim.keymap.set("n", "<Esc>", "i<Esc>", { buffer = buf, silent = true, desc = "FZF Quit" })
	end,
})
