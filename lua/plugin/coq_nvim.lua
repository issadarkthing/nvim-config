
local M = {}

function M.setup()
  vim.g.coq_settings = {
    match = {
      max_results = 2000
    }
  }

end

return M

