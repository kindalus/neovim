vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

vim.opt.termguicolors = true

-- vim.opt.colorcolumn = "120"


vim.keymap.set({"n", "i"}, "<C-Tab>", "<C-^>", {noremap = true, silent = true})
vim.keymap.set("n", "<leader>te", vim.cmd.Ex , { desc = "[T]oggle [E]xplorer" })

vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", {noremap = true, silent = true})
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", {noremap = true, silent = true})

vim.keymap.set("i", "<A-j>", "<Esc>:m .+1<CR>==gi", {noremap = true, silent = true})
vim.keymap.set("i", "<A-k>", "<Esc>:m .-2<CR>==gi", {noremap = true, silent = true})


vim.keymap.set("n", "<A-j>", ":m .+1<CR>==", {noremap = true, silent = true})
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==", {noremap = true, silent = true})


vim.keymap.set({"i", "n"}, "<C-k>", vim.lsp.buf.signature_help, {noremap = true, silent = true})
vim.keymap.set({"i", "n"}, "<C-a>", "<cmd>lua vim.lsp.buf.code_action()<CR>", {noremap = true, silent = true})

vim.keymap.set("i", "<Tab><Tab>", "copilot#Accept('\\<CR>')",  {expr = true, replace_keycodes = false})
vim.g.copilot_no_tab_map = true

