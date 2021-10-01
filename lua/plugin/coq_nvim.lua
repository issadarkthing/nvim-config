
local M = {}

function M.setup()
  vim.g.coq_settings = {
    ["match.max_results"] = 5000,
    ["clients.snippets.enabled"] = false,
    auto_start = 'shut-up',
    clients = {
      snippets = {
        warn = {}
      }
    }
  }

end

return M

