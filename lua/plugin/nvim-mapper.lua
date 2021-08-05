

local M = {}

M.mapper = function ()
  require'telescope'.extensions.mapper.mapper({
    attach_mappings = function(prompt_bufnr)
      local actions = require('telescope.actions')
      local action_state = require('telescope.actions.state')
      actions.select_default:replace(function()
        local selection = action_state.get_selected_entry()
        local nvim_feedkeys = vim.api.nvim_feedkeys
        local nvim_replace_termcodes = vim.api.nvim_replace_termcodes
        local cmd_k = nvim_replace_termcodes(selection.keys, true, false, true)
        nvim_feedkeys(cmd_k, "t", true)
        return actions.close(prompt_bufnr)
      end)
      return true
    end,
  })
end

return M
