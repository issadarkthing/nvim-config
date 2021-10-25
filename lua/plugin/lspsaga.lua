
local M = {}

function M.setup()
  local saga = require('lspsaga')
  local mapper = require('mappings')

  saga.init_lsp_saga {
    error_sign = '',
    warn_sign = '',
    hint_sign = '',
    infor_sign = '',
    code_action_icon = ' ',
  }

  mapper.mapper(
  "n",
  "<leader><leader>",
  "<cmd>Lspsaga code_action<cr>",
  "LSP Saga",
  "lsp_saga_code_action",
  "Code action") 

  --[[ mapper.mapper(
  "n",
  "K",
  "<cmd>Lspsaga hover_doc<cr>",
  "LSP Saga",
  "lsp_saga_code_hover",
  "Show documentation")  ]]

  mapper.mapper(
  "n",
  "<leader>gD",
  "<cmd>Lspsaga preview_definition<cr>",
  "LSP Saga",
  "lsp_saga_preview_definition",
  "Show definition") 

  mapper.mapper(
  "n",
  "<leader>E",
  "<cmd>lua require'lspsaga.diagnostic'.show_line_diagnostics()<cr>",
  "LSP Saga",
  "lsp_saga_show_diagnostics",
  "Show diagnostics")

end

return M




