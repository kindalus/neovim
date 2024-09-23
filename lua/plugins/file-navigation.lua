return {
     { -- Fuzzy Finder (files, lsp, etc)
          'nvim-telescope/telescope.nvim',
          event = 'VimEnter',
          branch = '0.1.x',
          dependencies = {
               'nvim-lua/plenary.nvim',
               { -- If encountering errors, see telescope-fzf-native README for installation instructions
                    'nvim-telescope/telescope-fzf-native.nvim',

                    -- `build` is used to run some command when the plugin is installed/updated.
                    -- This is only run then, not every time Neovim starts up.
                    build = 'make',

                    -- `cond` is a condition used to determine whether this plugin should be
                    -- installed and loaded.
                    cond = function()
                         return vim.fn.executable 'make' == 1
                    end,
               },

               { 'nvim-telescope/telescope-ui-select.nvim' },
               {
                    'nvim-tree/nvim-web-devicons',
                    enabled = vim.g.have_nerd_font
               },
          },


          config = function()
               require("telescope").setup({
                    -- You can put your default mappings / updates / etc. in here
                    --  All the info you're looking for is in `:help telescope.setup()`
                    --
                    -- defaults = {
                    --   mappings = {
                    --     i = { ['<c-enter>'] = 'to_fuzzy_refine' },
                    --   },
                    -- },
                    -- pickers = {}
                    defaults = {
                         file_ignore_patterns = {
                              "_templ.go",
                              ".git/",
                              "node_modules/",
                              "dist/",
                              "build/",
                              "out/",
                              "tmp/",
                         },
                    },
                    extensions = {
                         ['ui-select'] = {
                              require('telescope.themes').get_dropdown(),
                         },
                    },
               })

               -- Enable Telescope extensions if they are installed
               pcall(require('telescope').load_extension, 'fzf')
               pcall(require('telescope').load_extension, 'ui-select')

               -- See `:help telescope.builtin`
               local builtin = require 'telescope.builtin'
               vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
               vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = '[S]earch [K]eymaps' })
               vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles' })
               vim.keymap.set('n', '<leader>ss', builtin.builtin, { desc = '[S]earch [S]elect Telescope' })
               vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
               vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
               vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
               vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = '[S]earch [R]esume' })
               vim.keymap.set('n', '<leader>s.', builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
               vim.keymap.set('n', '<leader><leader>', builtin.buffers, { desc = '[ ] Find existing buffers' })

               -- Slightly advanced example of overriding default behavior and theme
               vim.keymap.set('n', '<leader>/', function()
                    -- You can pass additional configuration to Telescope to change the theme, layout, etc.
                    builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
                         winblend = 10,
                         previewer = false,
                    })
               end, { desc = '[/] Fuzzily search in current buffer' })

               -- It's also possible to pass additional configuration options.
               --  See `:help telescope.builtin.live_grep()` for information about particular keys
               vim.keymap.set('n', '<leader>s/', function()
                    builtin.live_grep {
                         grep_open_files = true,
                         prompt_title = 'Live Grep in Open Files',
                    }
               end, { desc = '[S]earch [/] in Open Files' })

               -- Shortcut for searching your Neovim configuration files
               vim.keymap.set('n', '<leader>sn', function()
                    builtin.find_files { cwd = vim.fn.stdpath 'config' }
               end, { desc = '[S]earch [N]eovim files' })
          end,
     },

     {
          "ThePrimeagen/harpoon",
          branch = "harpoon2",
          dependencies = { "nvim-lua/plenary.nvim" },
          config = function()
               local harpoon = require("harpoon")

               vim.keymap.set("n", "<leader>ha", function() harpoon:list():add() end, { desc = "Add current file to Harpoon" })
               vim.keymap.set("n", "<leader>hh", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = "Toggle Harpoon menu" })

               vim.keymap.set("n", "<leader>1", function() harpoon:list():select(1) end, { desc = "Select Harpoon list 1" })
               vim.keymap.set("n", "<leader>2", function() harpoon:list():select(2) end, { desc = "Select Harpoon list 2" })
               vim.keymap.set("n", "<leader>3", function() harpoon:list():select(3) end, { desc = "Select Harpoon list 3" })
               vim.keymap.set("n", "<leader>4", function() harpoon:list():select(4) end, { desc = "Select Harpoon list 4" })

               vim.keymap.set("n", "<leader>hd", function() harpoon:list():clear() end, { desc = "Clear Harpoon list" })

               -- Toggle previous & next buffers stored within Harpoon list
               vim.keymap.set("n", "<leader>k", function() harpoon:list():prev() end, { desc = "Previous Harpoon buffer" })
               vim.keymap.set("n", "<leader>j", function() harpoon:list():next() end, { desc = "Next Harpoon buffer" })
          end

     }
}
