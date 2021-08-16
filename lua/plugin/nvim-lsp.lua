
local M = {}

function M.setup()


  local mapper = require('mappings')
  local lspconfig = require('lspconfig')

  lspconfig.gopls.setup{}
  lspconfig.tsserver.setup{}

  vim.cmd[[highlight LspDiagnosticsVirtualTextError guifg=#f03434]]
  vim.cmd[[highlight LspDiagnosticsVirtualTextWarning guifg=yellow]]
  vim.cmd[[highlight LspDiagnosticsVirtualTextHint guifg=#f7ca18]]

  mapper.mapper(
  "n",
  "<leader>gd",
  "<cmd>lua vim.lsp.buf.definition()<cr>",
  "LSP",
  "lsp_go_to_definition",
  "LSP go to definition")

  mapper.mapper(
  "n",
  "<leader>yr",
  "<cmd>lua vim.lsp.buf.rename()<cr>",
  "LSP",
  "lsp_rename",
  "LSP rename")

  mapper.mapper(
  "n",
  "<leader>ca",
  "<cmd>lua vim.lsp.buf.code_action()<cr>",
  "LSP",
  "lsp_code_action",
  "LSP code actions")

  mapper.mapper(
  "n",
  "<leader>gr",
  "<cmd>lua vim.lsp.buf.references()<cr>",
  "LSP",
  "lsp_references",
  "LSP references")

  mapper.mapper(
  "n",
  "]g",
  "<cmd>lua vim.lsp.diagnostic.goto_next()<cr>",
  "LSP",
  "lsp_diagnostic_next",
  "LSP go to next diagnostic")

  mapper.mapper(
  "n",
  "[g",
  "<cmd>lua vim.lsp.diagnostic.goto_prev()<cr>",
  "LSP",
  "lsp_diagnostic_prev",
  "LSP go to previous diagnostic")

  mapper.mapper(
  "n",
  "<leader>yf",
  "<cmd>lua vim.lsp.buf.formatting()<cr>",
  "LSP",
  "lsp_formatting",
  "LSP formatting")

  mapper.mapper(
  "n",
  "<leader>gt",
  "<cmd>lua vim.lsp.buf.type_definition()<cr>",
  "LSP",
  "lsp_type_definition",
  "LSP type definition")

  mapper.mapper(
  "n",
  "K",
  "<cmd>lua vim.lsp.buf.hover()<cr>",
  "LSP",
  "lsp_show_doc",
  "LSP show documentation")

end

return M
