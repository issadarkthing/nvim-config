
local cmp = require('cmp')

cmp.setup.buffer{
  sources = {
    { name = 'buffer' },
    { name = 'look' }
  }
}
