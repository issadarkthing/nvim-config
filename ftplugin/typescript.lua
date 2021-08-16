local map = require('mappings')

-- jsdoc macro
vim.cmd[[let @c='o/** */jk==^f*;a ']]

-- eslint macro
vim.cmd[[let @e='O// eslint-disable-next-linejk']]

vim.b.tabstop = 2
vim.b.shiftwidth = 2
vim.b.expandtab = true

map.mapper(
  "n",
  "\\ll",
  ":CocCommand tsserver.watchBuild<cr>",
  "Coc Typescript",
  "coc_typescript_build",
  "Watch and build typescript project")

map.mapper(
  "n",
  "<leader>yi",
  ":CocCommand tsserver.organizeImports<cr>",
  "Coc Typescript",
  "coc_typescript_organize_imports",
  "Organize typescript imports")

map.mapper(
  "n",
  "\\rr",
  ":CocRestart<cr>",
  "Coc Typescript",
  "coc_restart",
  "Restart Coc")
