-- Create a bottom empty  area
vim.keymap.set("n", "<leader>wc", function()
     vim.cmd("botright new")
     vim.cmd("resize 8")
     vim.cmd("terminal")

     vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("i", true, false, true), "n", false)
end)




return {
     -- "gc" to comment visual regions/lines
     { "numToStr/Comment.nvim", opts = {} },

     -- Useful plugin to show you pending keybinds.
     {
          'folke/which-key.nvim',
          event = 'VimEnter', -- Sets the loading event to 'VimEnter'
          config = function() -- This is the function that runs, AFTER loading
               require('which-key').setup()

               -- Document existing key chains
               require('which-key').register {
                    ['<leader>c'] = { name = '[C]ode', _ = 'which_key_ignore' },
                    ['<leader>d'] = { name = '[D]ocument', _ = 'which_key_ignore' },
                    ['<leader>r'] = { name = '[R]ename', _ = 'which_key_ignore' },
                    ['<leader>s'] = { name = '[S]earch', _ = 'which_key_ignore' },
                    ['<leader>w'] = { name = '[W]orkspace', _ = 'which_key_ignore' },
                    ['<leader>t'] = { name = '[T]oggle', _ = 'which_key_ignore' },
                    ['<leader>h'] = { name = 'Git [H]unk', _ = 'which_key_ignore' },
               }
               -- visual mode
               require('which-key').register({
                    ['<leader>h'] = { 'Git [H]unk' },
               }, { mode = 'v' })
          end,
     },


     -- undo
     {
          "mbbill/undotree",
          config = function()
               vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
          end
     },


     -- syntax coloring
     {
          'nvim-treesitter/nvim-treesitter',
          -- Note: :TSUpdate will cause Packer to fail upon the first installation. It will run correctly when updating
          -- Comment this line on installation and the uncomment it
          -- run = ':TSUpdate'
          config = function()
               require 'nvim-treesitter.configs'.setup({
                    -- A list of parser names, or "all" (the five listed parsers should always be installed)
                    ensure_installed = { "lua", "vim", "vimdoc", "javascript", "typescript", "bash", "html", "css" },

                    -- Install parsers synchronously (only applied to `ensure_installed`)
                    sync_install = false,

                    -- Automatically install missing parsers when entering buffer
                    -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
                    auto_install = true,

                    -- List of parsers to ignore installing (or "all")
                    ignore_install = { "javascript" },


                    highlight = {
                         enable = true,
                         additional_vim_regex_highlighting = false,
                    },
               })
          end
     },


     -- linter
     {
          "folke/trouble.nvim",
          requires = { "nvim-tree/nvim-web-devicons" },
          opts = {
               -- your configuration comes here
               -- or leave it empty to use the default settings
               -- refer to the configuration section below
          },
          config = function()
               vim.keymap.set("n", "<leader>.", function() require("trouble").toggle("quickfix") end)
          end
     },

     -- git
     {
          "tpope/vim-fugitive",
          config = function()
               vim.keymap.set("n", "<leader>gg", vim.cmd.Git)
          end

     },


     -- debugging
     {
          "rcarriga/nvim-dap-ui",

          dependencies = {
               { "mfussenegger/nvim-dap" },
               { "nvim-neotest/nvim-nio" }
          },

          config = function()
               local dapui = require("dapui")
               local dap = require("dap")

               dapui.setup()

               dap.listeners.after.event_initialized["dapui_config"] = function()
                    dapui.open()
               end

               dap.listeners.before.event_terminated["dapui_config"] = function()
                    dapui.close()
               end

               dap.listeners.before.event_exited["dapui_config"] = function()
                    dapui.close()
               end


               vim.fn.sign_define('DapBreakpoint', { text = "\u{25CF}", texthl = '', linehl = '', numhl = '' })
               vim.fn.sign_define('DapStopped', { text = "\u{25B6}", texthl = '', linehl = '', numhl = '' })

               vim.keymap.set('n', '<F5>', dap.continue)
               vim.keymap.set('n', '<F10>', dap.step_over)
               vim.keymap.set('n', '<F11>', dap.step_into)
               vim.keymap.set('n', '<F12>', dap.step_out)
               vim.keymap.set('n', '<leader>bb', dap.toggle_breakpoint)
               vim.keymap.set('n', '<leader>dd', dapui.toggle)
          end
     },
     "theHamsta/nvim-dap-virtual-text"

}
