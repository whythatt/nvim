local map = vim.api.nvim_set_keymap local opts = { noremap = true, silent = true }

vim.g.mapleader = " "

map("n", "<leader>e", ":NvimTreeToggle<CR>", opts)
map("n", ",<leader>", ":nohlsearch<CR>", opts)
map("i", "jk", "<ESC>", opts)
