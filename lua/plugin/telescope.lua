local M = {}

function M.setup()

  local actions = require('telescope.actions')

  require'nvim-mapper'.setup{}
  local telescope = require('telescope')

  telescope.setup{
    defaults = {
      mappings = {
        i = {
          ["<esc>"] = actions.close,
          ["<c-j>"] = actions.move_selection_next,
          ["<c-k>"] = actions.move_selection_previous,
        }
      },

      prompt_prefix = ">> ",
      selection_caret = ">> ",
      set_env = { ['COLORTERM'] = 'truecolor' },
    },
  }

  telescope.load_extension('fzy_native')
  telescope.load_extension('mapper')

  local cmd = vim.cmd

  -- Selected item
  cmd[[highlight TelescopeSelection      ctermfg=6]]
  -- Selection caret
  cmd[[highlight TelescopeSelectionCaret ctermfg=39]]
  -- Multisections
  cmd[[highlight TelescopeMultiSelection ctermfg=14]]
  -- Floating windows created by telescope
  cmd[[highlight TelescopeNormal         ctermbg=NONE]]

  -- Border highlight groups
  cmd[[highlight TelescopeBorder         ctermfg=0]]
  cmd[[highlight TelescopePromptBorder   ctermfg=249]]
  cmd[[highlight TelescopeResultsBorder  ctermfg=249]]
  cmd[[highlight TelescopePreviewBorder  ctermfg=249]]

  -- Highlight characters your input matches
  cmd[[highlight TelescopeMatching ctermfg=1]]

  -- Color the prompt prefix
  cmd[[highlight TelescopePromptPrefix ctermfg=39]]

end

-- fallback to find_files if git_files can't find a .git directory
function M.project_files()
  local opts = {} -- define here if you want to define something
  local ok = pcall(require'telescope.builtin'.git_files, opts)
  if not ok then require'telescope.builtin'.find_files(opts) end
end

return M
