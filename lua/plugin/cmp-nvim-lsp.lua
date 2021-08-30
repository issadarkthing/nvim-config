local M = {}

function M.setup()

  -- The nvim-cmp almost supports LSP's capabilities so You should advertise it to LSP servers..
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

  -- The following example advertise capabilities to `clangd`.
  require'lspconfig'.tsserver.setup {
    capabilities = capabilities,
  }
end

return M
