vim.g.mapleader = "\\"
vim.keymap.set("n", "<leader>ex", vim.cmd.Ex)

-- Move text
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Window split and navigation
vim.keymap.set("n", "<leader>wq", "<C-w>q")
vim.keymap.set("n", "<leader>wx", "<C-w><C-v>")
vim.keymap.set("n", "<leader>wy", "<C-w>s")
vim.keymap.set("n", "<leader>wh", "<C-w>h")
vim.keymap.set("n", "<leader>wl", "<C-w>l")
vim.keymap.set("n", "<leader>wj", "<C-w>j")
vim.keymap.set("n", "<leader>wk", "<C-w>k")


