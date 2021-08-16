local map = require('mappings')


vim.bo.tabstop = 4
vim.bo.shiftwidth = 4

map.mapper(
  "n",
  "<leader>a",
  "<cmd>GoAlternate<cr>",
  "Vim Go",
  "vim_go_alternate",
  "Switch between test file and main file")

map.mapper(
  "n",
  "<leader>gt",
  "<cmd>GoTest<cr>",
  "Vim Go",
  "vim_go_test",
  "Run tests")

map.mapper(
  "n",
  "<leader>gi",
  "<cmd>GoImports<cr>",
  "Vim Go",
  "vim_go_imports",
  "Imports necessary packages")

map.mapper(
  "n",
  "<leader>gf",
  "<cmd>GoFmt<cr>",
  "Vim Go",
  "vim_go_fmt",
  "Format go file")


--disable vim-go doc
vim.b.go_doc_keywordprg_enabled = 0

--Highlight commonly used library types (`io.Reader`, etc.). >
vim.b.go_highlight_extra_types = 1


vim.b.go_highlight_operators           = true
vim.b.go_highlight_functions           = true
vim.b.go_highlight_function_parameters = true
vim.b.go_highlight_function_calls      = true
vim.b.go_highlight_types               = true
vim.b.go_highlight_diagnostic_errors   = true
vim.b.go_highlight_diagnostic_warnings = true
vim.b.go_highlight_fields              = true

vim.b.go_highlight_diagnostic_errors = false
vim.b.go_code_completion_enabled     = false
vim.b.go_imports_autosave            = false
vim.b.go_fmt_autosave                = false
vim.b.go_doc_popup_window            = false
vim.b.go_gopls_enabled               = true
