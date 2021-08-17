
local M = {}

function M.setup()
  local saga = require('lspsaga')
  local mapper = require('mappings')

  saga.init_lsp_saga()

  mapper.mapper(
  "n",
  "<leader><leader>",
  "<cmd>Lspsaga code_action<cr>",
  "LSP Saga",
  "lsp_saga_code_action",
  "Code action") 

  mapper.mapper(
  "n",
  "K",
  "<cmd>Lspsaga hover_doc<cr>",
  "LSP Saga",
  "lsp_saga_code_hover",
  "Show documentation") 

  mapper.mapper(
  "n",
  "<leader>gD",
  "<cmd>Lspsaga preview_definition<cr>",
  "LSP Saga",
  "lsp_saga_preview_definition",
  "Show definition") 

end

return M




