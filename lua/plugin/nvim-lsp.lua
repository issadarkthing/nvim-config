
local M = {}

function M.setup()


  local mapper = require('mappings')
  local lspconfig = require('lspconfig')
  local configs = require('lspconfig.configs')
  local util = require('lspconfig.util')

  lspconfig.tsserver.setup{}
  lspconfig.gopls.setup{}
  --[[ lspconfig.diagnosticls.setup{
    filetypes = { "typescript", "typescriptreact", "bash", "sh" },
    init_options = {
      filetypes = {
        javascript = "eslint",
        ["javascript.jsx"] = "eslint",
        javascriptreact = "eslint",
        typescript = "eslint",
        typescriptreact = "eslint",
        bash = "shellcheck",
        sh = "shellcheck",
      },
      linters = {
        eslint = {
          sourceName = "eslint",
          command = "eslint",
          rootPatterns = { ".git" },
          debounce = 100,
          args = {
            "--stdin",
            "--stdin-filename",
            "%filepath",
            "--format",
            "json",
          },
          parseJson = {
            errorsRoot = "[0].messages",
            line = "line",
            column = "column",
            endLine = "endLine",
            endColumn = "endColumn",
            message = "${message} [${ruleId}]",
            security = "severity",
          },
          securities = {
            [2] = "error",
            [1] = "warning"
          }
        },

        shellcheck = {
          command = "shellcheck",
          debounce = 100,
          args = { "--format", "json", "-" },
          sourceName = "shellcheck",
          parseJson = {
            line = "line",
            column = "column",
            endLine = "endLine",
            endColumn = "endColumn",
            message = "${message} [${code}]",
            security = "level"
          },
          securities = {
            [4] = "error",
            [3] = "warning",
            [2] = "info",
            [1] = "hint"
          }
        }
      }
    }
  } ]]


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
  "<leader><leader>",
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


  -- send error messages to quickfix list
  --[[ do
    local method = "textDocument/publishDiagnostics"
    local default_handler = vim.lsp.handlers[method]
    vim.lsp.handlers[method] = function(err, method, result, client_id, bufnr, config)
      default_handler(err, method, result, client_id, bufnr, config)
      local diagnostics = vim.lsp.diagnostic.get_all()
      local qflist = {}
      for bufnr, diagnostic in pairs(diagnostics) do
        for _, d in ipairs(diagnostic) do
          d.bufnr = bufnr
          d.lnum = d.range.start.line + 1
          d.col = d.range.start.character + 1
          d.text = d.message
          table.insert(qflist, d)
        end
      end
      vim.lsp.util.set_qflist(qflist)
    end
  end ]]

end

return M
