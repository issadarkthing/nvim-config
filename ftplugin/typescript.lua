local map = require('mappings')

-- jsdoc macro
vim.cmd[[let @c='o/** */jk==^f*;a ']]

-- eslint macro
vim.cmd[[let @e='O// eslint-disable-next-linejk']]

vim.b.tabstop = 2
vim.b.shiftwidth = 2
vim.b.expandtab = true
