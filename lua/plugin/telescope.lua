local actions = require('telescope.actions')

require('telescope').setup{
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
  }
}

require'telescope'.load_extension('fzy_native')
