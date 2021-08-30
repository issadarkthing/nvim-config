
local M = {}

function M.setup()
  vim.g.coq_settings = {
    ["match.max_results"] = 1000,
    ["clients.snippets.enabled"] = false,
  }

  vim.cmd[[COQnow -s]]
end

return M

