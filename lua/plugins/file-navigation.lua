return {
     {
          "nvim-telescope/telescope.nvim",
          dependencies = {
               "nvim-lua/plenary.nvim"
          },
          opts = {

               file_ignore_patters = { "node_modules" }
          },
          config = function()
               local builtin = require('telescope.builtin')

               vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
               --vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
               --vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
               --vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
               vim.keymap.set('n', '<leader>fg', builtin.git_files, {})
               vim.keymap.set('n', '<leader>fw', function()
                    builtin.grep_string({ search = vim.fn.input("Grep > ") });
               end)
          end

     },

     {
          {
               "ThePrimeagen/harpoon",
               branch = "harpoon2",
               dependencies = { "nvim-lua/plenary.nvim" },
               config = function()
                    vim.keymap.set("n", "<leader>ha", function() harpoon:list():add() end)
                    vim.keymap.set("n", "<leader>hh", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

                    vim.keymap.set("n", "<leader>1", function() harpoon:list():select(1) end)
                    vim.keymap.set("n", "<leader>2", function() harpoon:list():select(2) end)
                    vim.keymap.set("n", "<leader>3", function() harpoon:list():select(3) end)
                    vim.keymap.set("n", "<leader>4", function() harpoon:list():select(4) end)

                    -- Toggle previous & next buffers stored within Harpoon list
                    vim.keymap.set("n", "<leader>k", function() harpoon:list():prev() end)
                    vim.keymap.set("n", "<leader>j", function() harpoon:list():next() end)
               end

          }
     }
}
