-- vim.keymap.set(mode, action)
-- modes: n - normal, i - insert, v - visual, etc.
-- actions: <Cmd><command><CR> - run command

-- Neotree toggle
vim.keymap.set("n", "<leader>e", "<Cmd>Neotree toggle<CR>")

-- Delete withou yanking
vim.keymap.set("n", "dd", '"_dd')
vim.keymap.set("v", "d", '"_d')
