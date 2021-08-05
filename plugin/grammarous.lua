local map = require('mappings')

-- grammar fix

map.mapper(
  "n",
  "<leader>gmf",
  "<Plug>(grammarous-fixit)",
  "Grammarous",
  "grammarous_fixit",
  "Fix current error",
  {noremap = false})

map.mapper(
  "n",
  "<leader>gmn",
  "<Plug>(grammarous-move-to-next-error)",
  "Grammarous",
  "grammarous_move_next_error",
  "Move to next error",
  {noremap = false})

