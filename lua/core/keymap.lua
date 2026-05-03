-- vim.keymap.set(mode, action)
-- modes: n - normal, i - insert, v - visual, etc.
-- actions: <Cmd><command><CR> (CR = Enter)

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
