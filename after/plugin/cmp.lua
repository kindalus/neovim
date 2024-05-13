local cmp = require('cmp')

cmp.setup({
  mapping = cmp.mapping.preset.insert({
    -- confirm completion
    ["<Tab>"] = cmp.mapping.confirm({select = true}),
    ["<C-Space>"] = cmp.mapping.complete(),

  }),

  window = {
     completion = cmp.config.window.bordered(),
     documentation = cmp.config.window.bordered(),
  }
})

