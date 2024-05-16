return {

     {
          "VonHeikemen/lsp-zero.nvim",
          branch = "v3.x",
          config = function()
               local lsp_zero = require('lsp-zero')
               lsp_zero.extend_lspconfig()




               lsp_zero.on_attach(function(client, bufnr)
                    -- see :help lsp-zero-keybindings
                    -- to learn the available actions
                    lsp_zero.default_keymaps({ buffer = bufnr })

                    vim.keymap.set({ "n", "i", "x" }, "<C-.>", "<cmd>lua vim.lsp.buf.code_action()<CR>",
                         { buffer = bufnr, noremap = true, silent = true })

                    vim.keymap.set("v", "<C-.>", "<cmd>lua vim.lsp.buf.code_action()<CR>",
                         { buffer = bufnr, noremap = true, silent = true })


                    vim.keymap.set("n", "<leader>F", "<cmd>LspZeroFormat<cr>")
               end)



               local cmp = require("cmp")
               cmp.setup({
                    sources = {
                         { name = 'nvim_lsp' },
                    },
                    mapping = {
                         ['<C-y>'] = cmp.mapping.confirm({ select = true }),
                         ['<CR>'] = cmp.mapping.confirm({ select = true }),
                         ['<Tab>'] = cmp.mapping.confirm({ select = true }),

                         ['<Esc>'] = cmp.mapping.abort({ select = true }),
                         ["<C-Space>"] = cmp.mapping.complete(),

                    },
                    snippet = {
                         expand = function(args)
                              require('luasnip').lsp_expand(args.body)
                         end,
                    },
               })
          end
     },
     {
          "williamboman/mason.nvim", opts = {}
     },
     {
          "williamboman/mason-lspconfig.nvim",
          config = function()
               require("mason-lspconfig").setup({

                    ensure_installed = {
                         "bashls",
                         "denols",
                         "dockerls",
                         "docker_compose_language_service",
                         "tsserver",
                         "templ",
                         "golangci_lint_ls",
                         "gopls",
                         "lua_ls",
                         "volar",
                    },
                    handlers = {
                         function(server_name)
                              if server_name == "lua_ls" then
                                   require 'lspconfig'.lua_ls.setup {
                                        on_init = function(client)
                                             local path = client.workspace_folders[1].name
                                             if vim.loop.fs_stat(path .. '/.luarc.json') or vim.loop.fs_stat(path .. '/.luarc.jsonc') then
                                                  return
                                             end

                                             client.config.settings.Lua = vim.tbl_deep_extend('force',
                                                  client.config.settings.Lua, {
                                                       workspace = {
                                                            checkThirdParty = false,
                                                            library = {
                                                                 vim.env.VIMRUNTIME
                                                            }
                                                       }
                                                  })
                                        end,
                                        settings = {
                                             Lua = {}
                                        }
                                   }
                              else
                                   require('lspconfig')[server_name].setup({})
                              end
                         end,
                    },
               })
          end
     },
     { "neovim/nvim-lspconfig" },
     { "hrsh7th/cmp-nvim-lsp" },
     { "hrsh7th/nvim-cmp" },
     { "L3MON4D3/LuaSnip" },

}
