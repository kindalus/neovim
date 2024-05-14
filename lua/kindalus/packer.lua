
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
   use 'leoluz/nvim-dap-go' -- Install the plugin with Packer

   require("dapui").setup()
   require("dap-go").setup()

   -- colorschemes
   use "projekt0n/github-nvim-theme"
   use "shaunsingh/nord.nvim"
   use { "rose-pine/neovim", as = "rose-pine" }
   use "olimorris/onedarkpro.nvim"

   use {
      'VonHeikemen/fine-cmdline.nvim',
      requires = {
         {'MunifTanjim/nui.nvim'}
      }
   }
   --vim.api.nvim_set_keymap('n', ':', '<cmd>FineCmdline<CR>', {noremap = true})

end)
