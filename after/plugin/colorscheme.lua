require('github-theme').setup({
   options = {
      hide_nc_statusline = true, -- Override the underline style for non-active statuslines
      transparent = true,       -- Disable setting background
      terminal_colors = true,    -- Set terminal colors (vim.g.terminal_color_*) used in `:terminal`
      dim_inactive = false,      -- Non focused panes set to alternative background
   }
})

vim.cmd('colorscheme github_dark_tritanopia')

