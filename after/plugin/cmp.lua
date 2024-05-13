local cmp = require('cmp')

cmp.setup({
  mapping = cmp.mapping.preset.insert({
    -- confirm completion
    ['<Tab>'] = cmp.mapping.confirm({select = true}),

    -- scroll up and down the documentation window
    -- ['<C-u>'] = cmp.mapping.scroll_docs(-4),
    -- ['<C-d>'] = cmp.mapping.scroll_docs(4),   
  }),
})

