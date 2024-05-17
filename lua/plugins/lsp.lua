return {

     {
          "VonHeikemen/lsp-zero.nvim",
          branch = "v3.x",
          config = function()
               local lsp_zero = require('lsp-zero')

               lsp_zero.on_attach(function(client, bufnr)
                    -- see :help lsp-zero-keybindings
                    -- to learn the available actions
                    lsp_zero.default_keymaps({ buffer = bufnr })

                    vim.keymap.set({ "n", "i", "x" }, "<C-.>", "<cmd>lua vim.lsp.buf.code_action()<CR>",
                         { buffer = bufnr, noremap = true, silent = true, desc = "Code Action" })

                    vim.keymap.set("v", "<C-.>", "<cmd>lua vim.lsp.buf.code_action()<CR>",
                         { buffer = bufnr, noremap = true, silent = true, desc = "Code Action" })

                    vim.keymap.set('n', 'gd', require('telescope.builtin').lsp_definitions,
                         { buffer = bufnr, desc = '[G]oto [D]efinition' })
                    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { buffer = bufnr, desc = '[G]oto [D]eclaration' })
                    vim.keymap.set('n', 'gr', require('telescope.builtin').lsp_references,
                         { buffer = bufnr, desc = '[G]oto [R]eferences' })
                    vim.keymap.set('n', 'gI', require('telescope.builtin').lsp_implementations,
                         { buffer = bufnr, desc = '[G]oto [I]mplementation' })

                    vim.keymap.set('n', '<leader>D', require('telescope.builtin').lsp_type_definitions,
                         { buffer = bufnr, desc = 'Type [D]efinition' })

                    vim.keymap.set('n', '<leader>ds', require('telescope.builtin').lsp_document_symbols,
                         { buffer = bufnr, desc = '[D]ocument [S]ymbols' })

                    vim.keymap.set('n', '<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols,
                         { buffer = bufnr, desc = '[W]orkspace [S]ymbols' })

                    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { buffer = bufnr, desc = '[R]e[n]ame' })

                    vim.keymap.set("n", "<leader>cf", "<cmd>LspZeroFormat<cr>", { desc = "[C]ode [F]ormat" })

                    vim.keymap.set('n', 'K', vim.lsp.buf.hover, { buffer = bufnr, desc = 'Hover Documentation' })
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

               require("lsp-zero").extend_lspconfig()

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
