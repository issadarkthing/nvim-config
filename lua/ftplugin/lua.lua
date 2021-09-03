local cmp = require('cmp')

cmp.setup.buffer{
  sources = {
    { name = 'nvim_lua' },
    { name = 'buffer' },
  }
}
