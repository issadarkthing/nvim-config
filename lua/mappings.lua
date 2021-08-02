

local function map(mode, lhs, rhs, opts)
  local options = {noremap = true}
  if opts then options = vim.tbl_extend('force', options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end


map('n', '<leader>f', "<cmd>lua require'plugin/telescope'.project_files()<cr>")
map('n', '<leader>F', '<cmd>Telescope find_files<cr>')
