local map = require('mappings')

map.mapper(
  "n",
  "<leader>yff",
  "<cmd>PrettierPartial<cr>",
  "Prettier",
  "prettier_partial",
  "Partially format the selected lines")

map.mapper(
  "n",
  "<leader>yF",
  "<cmd>Prettier<cr>",
  "Prettier",
  "prettier",
  "Format buffer")
