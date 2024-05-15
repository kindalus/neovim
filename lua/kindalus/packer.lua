
-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
   -- Packer can manage itself
   use 'wbthomason/packer.nvim'

   use {
      'nvim-telescope/telescope.nvim', tag = '0.1.6',
      -- or, branch = '0.1.x',
      requires = { {'nvim-lua/plenary.nvim'} }
   }

   use {
      'nvim-treesitter/nvim-treesitter',
      -- Note: :TSUpdate will cause Packer to fail upon the first installation. It will run correctly when updating
      -- Comment this line on installation and the uncomment it
      -- run = ':TSUpdate'
   }

   use "theprimeagen/harpoon"

   use {
      'VonHeikemen/lsp-zero.nvim',
      branch = 'v3.x',
      requires = {
         --- Uncomment the two plugins below if you want to manage the language servers from neovim
         {'williamboman/mason.nvim'},
         {'williamboman/mason-lspconfig.nvim'},

         {'neovim/nvim-lspconfig'},
         {'hrsh7th/nvim-cmp'},
         {'hrsh7th/cmp-nvim-lsp'},
         {'L3MON4D3/LuaSnip'},
      }
   }

   -- Debugging
   use "mbbill/undotree"
   use "tpope/vim-fugitive"
   use {
        "rcarriga/nvim-dap-ui",

        requires = {
             {"mfussenegger/nvim-dap"},
             {"nvim-neotest/nvim-nio"}
        }
   }
   use "theHamsta/nvim-dap-virtual-text"

   -- Colorschemes
   use "projekt0n/github-nvim-theme"
   use "shaunsingh/nord.nvim"
   use { "rose-pine/neovim", as = "rose-pine" }
   use "olimorris/onedarkpro.nvim"


   -- Goodies
   use  {
        "folke/noice.nvim",
        event = "VimEnter",
        opts = {
             -- add any options here
        },
        requires = {
             -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
             "MunifTanjim/nui.nvim",
             -- OPTIONAL:
             --   `nvim-notify` is only needed, if you want to use the notification view.
             --   If not available, we use `mini` as the fallback
             "rcarriga/nvim-notify",
        }
   }


   use {
        "folke/trouble.nvim",
        requires = { "nvim-tree/nvim-web-devicons" },
        opts = {
             -- your configuration comes here
             -- or leave it empty to use the default settings
             -- refer to the configuration section below
        },
   }

   -- Programming in go
   use "ray-x/go.nvim"
   use 'ray-x/guihua.lua' -- recommended if need floating window support
   use "leoluz/nvim-dap-go"


end)
