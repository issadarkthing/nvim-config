
local M = {}

function M.setup()
  vim.g.coq_settings = {
    ["match.max_results"] = 5000,
    ["clients.snippets.enabled"] = false,
    auto_start = 'shut-up',
    clients = {
      snippets = {
        warn = {}
      },
      lsp = {
        weight_adjust = 1.2,
      },
      buffers = {
        enabled = false,
      }
    },
    keymap = { recommended = false },
  }

end

return M

