-- vim.keymap.set(mode, action)
-- modes: n - normal, i - insert, v - visual, etc.
-- actions: <Cmd><command><CR> - run command

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
