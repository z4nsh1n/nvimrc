vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("i", "<C-l>", "<cmd>lua require('luasnip').jump(1)<cr>")
vim.keymap.set("i", "<C-h>", "<cmd>lua require('luasnip').jump(-1)<cr>")

vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("n", "<C-s>", "<cmd>silent !tmux neww tms<cr>")

