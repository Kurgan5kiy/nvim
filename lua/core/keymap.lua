-- vim.keymap.set(mode, action)
-- modes: n - normal, i - insert, v - visual, t - terminal, etc.
-- actions: <Cmd><command><CR> (CR = Enter)

-- Exit insert and terminal modes quickly
vim.keymap.set("i", "jk", "<Esc>", { desc = "Exit insert mode" })
vim.keymap.set("t", "jk", "<C-\\><C-n>", { desc = "Exit terminal mode (Enter Normal Mode)" })

-- Neotree toggle
vim.keymap.set("n", "<leader>e", "<Cmd>Neotree toggle<CR>")

-- Delete without yanking
vim.keymap.set("n", "dd", '"_dd')
vim.keymap.set("v", "d", '"_d')

-- Window navigation
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move to lower window" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move to upper window" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })

-- LSP & Diagnostics
vim.keymap.set("n", "<leader>lhd", vim.lsp.buf.hover, { desc = "LSP Hover Doc (Press twice to jump inside)" })
vim.keymap.set("n", "<leader>lhi", function() vim.diagnostic.open_float({ focus = true }) end, { desc = "LSP Hover Info (Errors)" })
vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, { desc = "Go to Definition" })
vim.keymap.set("n", "<leader>lr", "<Cmd>LspRestart<CR>", { desc = "LSP Reload" })
vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format, { desc = "LSP Format" })

-- Buffers
vim.keymap.set("n", "<S-j>", "<Cmd>BufferLineCyclePrev<CR>", { desc = "Previous Buffer" })
vim.keymap.set("n", "<S-k>", "<Cmd>BufferLineCycleNext<CR>", { desc = "Next Buffer" })
vim.keymap.set("n", "<leader>bd", function() require("mini.bufremove").delete(0, false) end, { desc = "Delete Buffer" })

-- Fuzzy Finder (fzf-lua)
vim.keymap.set("n", "<leader>ff", "<Cmd>FzfLua files<CR>", { desc = "Find Files" })
vim.keymap.set("n", "<leader>fw", "<Cmd>FzfLua grep_cword<CR>", { desc = "Find Word (Cursor)" })
vim.keymap.set("n", "<leader>fW", "<Cmd>FzfLua live_grep<CR>", { desc = "Find Any Word" })
vim.keymap.set("n", "<leader>fr", "<Cmd>FzfLua resume<CR>", { desc = "Resume Search" })

-- Flash.nvim (Motions & Jumping)
vim.keymap.set("n", "<leader>hp", function() require("flash").jump() end, { desc = "Hop to Exact Place" })
vim.keymap.set("n", "<leader>hl", function() require("flash").treesitter() end, { desc = "Hop Logical Parts (Treesitter)" })

vim.keymap.set("n", "<leader>hw", function()
	require("flash").jump({
		search = { mode = "search", max_length = 0 },
		label = { after = { 0, 0 } },
		pattern = "\\<"
	})
end, { desc = "Hop by Words" })

vim.keymap.set("n", "<leader>hyw", function()
	local orig_pos = vim.api.nvim_win_get_cursor(0)
	require("flash").jump({
		action = function(match, state)
			vim.api.nvim_win_call(match.win, function()
				vim.api.nvim_win_set_cursor(match.win, match.pos)
				vim.cmd("normal! yiw")
			end)
			vim.api.nvim_win_set_cursor(0, orig_pos)
		end
	})
end, { desc = "Hop & Yank Word" })

vim.keymap.set("n", "<leader>hyl", function()
	local orig_pos = vim.api.nvim_win_get_cursor(0)
	require("flash").jump({
		action = function(match, state)
			vim.api.nvim_win_call(match.win, function()
				vim.api.nvim_win_set_cursor(match.win, match.pos)
				vim.cmd("normal! yy")
			end)
			vim.api.nvim_win_set_cursor(0, orig_pos)
		end
	})
end, { desc = "Hop & Yank Line" })

vim.keymap.set("n", "<leader>hi", function()
	require("flash").jump({
		matcher = function(win)
			local buf = vim.api.nvim_win_get_buf(win)
			local diags = vim.diagnostic.get(buf)
			local matches = {}
			for _, diag in ipairs(diags) do
				table.insert(matches, {
					pos = { diag.lnum + 1, diag.col },
					end_pos = { diag.end_lnum + 1, diag.end_col },
					win = win,
				})
			end
			return matches
		end,
		action = function(match, state)
			vim.api.nvim_win_call(match.win, function()
				vim.api.nvim_win_set_cursor(match.win, match.pos)
				vim.diagnostic.open_float()
			end)
		end
	})
end, { desc = "Hop to Issue (Errors/Warnings)" })
