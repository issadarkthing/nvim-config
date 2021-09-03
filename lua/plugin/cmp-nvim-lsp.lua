local M = {}

function M.setup()

  -- The nvim-cmp almost supports LSP's capabilities so You should advertise it to LSP servers..
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities, {
    snippetSupport = false,
  })

  -- The following example advertise capabilities to `clangd`.
  require'lspconfig'.tsserver.setup {
    capabilities = capabilities,
    filetypes = {"typescript", "typescriptreact", "typescript.tsx"}
  }

end

return M
