local map = require('mappings')

local M = {}

function M.setup()

  map.mapper(
    "n",
    "<leader>gd",
    "<plug>(coc-definition)",
    "Coc",
    "coc_go_to_definition",
    "Go to definition",
    { noremap = false })

  map.mapper(
    "n",
    "<leader>gy",
    "<plug>(coc-type-definition)",
    "Coc",
    "coc_go_to_type_definition",
    "Go to type definition",
    { noremap = false })

  map.mapper(
    "n",
    "<leader>gi",
    "<plug>(coc-implementation)",
    "Coc",
    "coc_go_to_implementation",
    "Go to implementation",
    { noremap = false })

  map.mapper(
    "n",
    "<leader>gr",
    "<plug>(coc-references)",
    "Coc",
    "coc_go_to_references",
    "Go to references",
    { noremap = false })


  map.mapper(
    "n",
    "K",
    "<cmd>lua vim.fn.timer_start(0, require'plugin/coc'.show_documentation)<cr>",
    "Coc",
    "coc_doc",
    "Open documentation of symbol under cursor",
    { noremap = false })

  map.mapper(
    "n",
    "<leader>yr",
    "<plug>(coc-rename)",
    "Coc",
    "coc_symbol_rename",
    "Rename symbol under cursor",
    { noremap = false })

  map.mapper(
    "n",
    "<leader><leader>",
    "<plug>(coc-fix-current)",
    "Coc",
    "coc_auto_fix",
    "Auto fix",
    { noremap = false })

  map.mapper(
    "n",
    "[g",
    "<plug>(coc-diagnostic-prev)",
    "Coc",
    "coc_go_to_prev_diagnostic",
    "Go to prev diagnostic",
    { noremap = false })

  map.mapper(
    "n",
    "]g",
    "<plug>(coc-diagnostic-next)",
    "Coc",
    "coc_go_to_next_diagnostic",
    "Go to next diagnostic",
    { noremap = false })

  map.mapper(
    "n",
    "K",
    "<cmd>call CocActionAsync('doHover')<cr>",
    "Coc",
    "coc_hover",
    "Show documentation")

  -- Use jk to confirm completion, `<C-g>u` means break undo chain at current
  -- position. Coc only does snippet and additional edit on confirm.
  -- <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
  if vim.fn.exists('*complete_info') then
    map.map(
      "i", 
      "<cr>", 
      [[complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"]], 
      { expr = true }) 
  else
    map.map(
      "i", 
      "<cr>", 
      [[pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"]], 
      { expr = true }) 
  end


end

return M
