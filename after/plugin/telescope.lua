local telescope = require("telescope")
local builtin = require('telescope.builtin')

telescope.setup({
   file_ignore_patters = {"node_modules"}

})

vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
--vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
--vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
--vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>fg', builtin.git_files, {})
vim.keymap.set('n', '<leader>fw', function()
	builtin.grep_string({search = vim.fn.input("Grep > ") });
end)


