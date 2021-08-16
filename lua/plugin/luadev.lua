

local M = {}

M.exec_current_line = function()
  vim.api.nvim_command('Luadev')
  require'luadev'.exec(vim.api.nvim_get_current_line())
end

return M
