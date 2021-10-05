local M = {}

function M.setup()
  vim.api.nvim_set_keymap(
    'n', 
    '<cr>', 
    'pumvisible() ? (complete_info().selected == -1 ? "<C-e><Plug>AutoPairsReturn" : "<C-y>") : "<Plug>AutoPairsReturn"',
    {expr = true, noremap = false})
end

return M
