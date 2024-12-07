return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-lua/popup.nvim",
  },

  config = function()
    local harpoon = require("harpoon")

    vim.keymap.set("n", "<leader>h1", function() harpoon:list():select(1) end, { noremap = true, desc = "Harpoon: Go to bookmark 1" })
    vim.keymap.set("n", "<leader>h2", function() harpoon:list():select(2) end, { noremap = true, desc = "Harpoon: Go to bookmark 2" })
    vim.keymap.set("n", "<leader>h3", function() harpoon:list():select(3) end, { noremap = true, desc = "Harpoon: Go to bookmark 3" })
    vim.keymap.set("n", "<leader>h4", function() harpoon:list():select(4) end, { noremap = true, desc = "Harpoon: Go to bookmark 4" })
    vim.keymap.set("n", "<leader>h5", function() harpoon:list():select(5) end, { noremap = true, desc = "Harpoon: Go to bookmark 5" })

    vim.keymap.set("n", "<leader>ha", function() harpoon:list():add() end, { noremap = true, desc = "Harpoon: Add current file" })
    vim.keymap.set("n", "<leader>hc", function() harpoon:list():clear() end, { noremap = true, desc = "Harpoon: Clear all bookmarks" })

    vim.keymap.set("n", "<leader>hd", function() harpoon:list():remove() end, { noremap = true, desc = "Harpoon: Remove current bookmark" })

    vim.keymap.set("n", "<leader>hh", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { noremap = true, desc = "Harpoon: Toggle quick menu" })

    vim.keymap.set("n", "<leader>hj", function() harpoon:list():next() end, { noremap = true, desc = "Harpoon: Move down" })
    vim.keymap.set("n", "<leader>hk", function() harpoon:list():prev() end, { noremap = true, desc = "Harpoon: Move up" })
  end


}
