return {

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
               require'nvim-treesitter.configs'.setup {
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
               }
          end
     },


     -- lsp
     {
          'VonHeikemen/lsp-zero.nvim',
          branch = 'v3.x',
          dependencies = {
               --- Uncomment the two plugins below if you want to manage the language servers from neovim
               {'williamboman/mason.nvim'},
               {'williamboman/mason-lspconfig.nvim'},

               {'neovim/nvim-lspconfig'},
               {'hrsh7th/nvim-cmp'},
               {'hrsh7th/cmp-nvim-lsp'},
               {'L3MON4D3/LuaSnip'},
          },

          config = function() 

               local cmp =  require('cmp')
               local zero =  require('lsp-zero')
               local mason = require("mason")
               local lspconfig = require("lspconfig")
               local masonconfig = require("mason-lspconfig")

               zero.on_attach(function(client, bufnr)
                    zero.default_keymaps({buffer = bufnr})
               end)

               mason.setup({})

               masonconfig.setup({
                    -- Replace the language servers listed here
                    -- with the ones you want to install
                    handlers = {
                         function(server_name)
                              lspconfig[server_name].setup({})
                         end,
                    }
               })


               -- Function to check if an executable exists in the system's PATH
               local function executable_exists(exe)
                    local path = vim.fn.system('command -v ' .. exe)
                    return path ~= ""
               end

               -- Check if 'lua-language-server' is installed
               if executable_exists('lua-language-server') then
                    lspconfig.lua_ls.setup {
                         settings = {
                              Lua = {
                                   runtime = {
                                        version = 'LuaJIT',  -- Neovim uses LuaJIT
                                   },
                                   diagnostics = {
                                        globals = {'vim'},  -- Recognize 'vim' as a global variable
                                   },
                                   workspace = {
                                        library = vim.api.nvim_get_runtime_file("", true),
                                   },
                                   telemetry = {
                                        enable = false,  -- Disable telemetry
                                   },
                              },
                         },
                    }
               else
                    print("lua-language-server not installed, skipping setup")
               end

               cmp.setup({
                    mapping = cmp.mapping.preset.insert({
                         -- confirm completion
                         ["<CR>"] = cmp.mapping.confirm({select = true}),
                         ["<C-Space>"] = cmp.mapping.complete(),

                    }),

                    window = {
                         completion = cmp.config.window.bordered(),
                         documentation = cmp.config.window.bordered(),
                    }
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
               {"mfussenegger/nvim-dap"},
               {"nvim-neotest/nvim-nio"}
          },

          config = function() 
               local dapui = require("dapui") 
               local dap = require("dap")

               dapui.setup()



               dap.listeners.after.event_initialized["dapui_config"]=function()
                    dapui.open()
               end

               dap.listeners.before.event_terminated["dapui_config"]=function()
                    dapui.close()
               end

               dap.listeners.before.event_exited["dapui_config"]=function()
                    dapui.close()
               end


               vim.fn.sign_define('DapBreakpoint',{ text ="\u{25CF}", texthl ='', linehl ='', numhl =''})
               vim.fn.sign_define('DapStopped',{ text ="\u{25B6}", texthl ='', linehl ='', numhl =''})

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
