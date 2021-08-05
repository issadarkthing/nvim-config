local Mapper = require("nvim-mapper")

local M = {}

local function mapper(mode, lhs, rhs, category, id, desc, opts)
  local options = {noremap = true, silent = true}
  if opts then options = vim.tbl_extend('force', options, opts) end
  Mapper.map(mode, lhs, rhs, options, category, id, desc)
end

local function map(mode, lhs, rhs, opts)
  local options = {noremap = true, silent = true}
  if opts then options = vim.tbl_extend('force', options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

M.mapper = mapper
M.map = map

-- {{ key map alias }}
map('n', '<m-`>', '<c-^>')
map('n', 'n', 'nzzzv')
map('n', 'N', 'Nzzzv')
map('n', 'q:', ':q<cr>')
-- automatic center when jump to next or previous position
map('n', '<c-o>', '<c-o>zz')
map('n', '<c-i>', '<c-i>zz')
-- use tab for trigger completion with characters ahead and navigate.
map('i', '<tab>', 'pumvisible() ? "<C-n>" : "<tab>"', {expr = true})
map('i', '<s-tab>', 'pumvisible() ? "<C-p>" : "<s-tab>"', {expr = true})

-- add relative line jump to jump list
map('n', 'k', '(v:count > 1 ? "m\'" . v:count : \'\') . \'gk\'', {expr = true})
map('n', 'j', '(v:count > 1 ? "m\'" . v:count : \'\') . \'gj\'', {expr = true})

-- remap escape key to exit fzf
if vim.o.filetype == "fzf" or vim.o.filetype == "lazygit" then
  map('t', '<esc>', '<c-\\><c-n>', {buffer = true})
end

mapper(
  'n', 
  '<leader>mm', 
  "<cmd>lua require'plugin/nvim-mapper'.mapper()<cr>",
  "Telescope Mapper", 
  "telescope_mapper_find_definition", 
  "Find mapping definition")

mapper(
  'n', 
  '<leader>MM', 
  "<cmd>Telescope mapper<cr>",
  "Telescope Mapper", 
  "telescope_mapper_find_exec", 
  "Find mapping and execute")

mapper(
  'n', 
  '<leader>f', 
  "<cmd>lua require'plugin/telescope'.project_files()<cr>",
  "Telescope", 
  "telescope_find", 
  "Find files in git project and fallback to file if not in git project")

mapper(
  'n', 
  '<leader>F', 
  '<cmd>Telescope find_files<cr>',
  "Telescope",
  "telescope_find_file",
  "Find file")

mapper(
  'n',
  '<leader>rg',
  '<cmd>Telescope live_grep<cr>',
  "Telescope",
  "telescope_grep",
  "Find line")

mapper(
  "n",
  "<leader>bb",
  "<cmd>Telescope buffers<cr>",
  "Telescope",
  "telescope_buffer",
  "Find all opened buffers")


mapper(
  "i",
  "jk",
  "<esc>",
  "General",
  "escape_normal",
  "Escapes normal mode")


mapper(
  "i",
  "JK",
  "<esc>",
  "General",
  "escape_normal_1",
  "Escapes normal mode")

mapper(
  "n",
  "<leader>ec",
  ":e ~/.config/nvim/init.lua<cr>",
  "Config",
  "edit_config_file",
  "Edit init.vim")

mapper(
  "n",
  "<leader>v",
  ":source ~/.config/nvim/init.lua<cr>",
  "Config",
  "source_config_file",
  "Source init.vim")

mapper(
  "n",
  "m",
  ":silent w<cr>",
  "Save",
  "save",
  "Save current file")

mapper(
  "n",
  "<leader>lz",
  ":LazyGit<cr>",
  "LazyGit",
  "open_lazygit",
  "Open lazygit prompt")


mapper(
  "n",
  "<c-l>",
  ":bnext<cr>",
  "Buffer",
  "buffer_next",
  "Go to next buffer list")

mapper(
  "n",
  "<c-p>",
  ":bprev<cr>",
  "Buffer",
  "buffer_prev",
  "Go to previous buffer list")

mapper(
  "n",
  "<leader>bd",
  ":bd<cr>",
  "Buffer",
  "buffer_delete",
  "Delete current buffer")

mapper(
  "n",
  "<leader>bo",
  ":%bd!|e#|bd#<cr>|'\"",
  "Buffer",
  "buffer_delete_all",
  "Delete all buffers except current buffer")

mapper(
  "n",
  "<a-w>",
  ":b#<cr>",
  "Buffer",
  "buffer_alternate",
  "Alternate between recently opened buffers")

mapper(
  "n",
  "<a-left>",
  ":vert resize +5<cr>",
  "Window",
  "resize_window_left",
  "Increase window vertical size by 5")

mapper(
  "n",
  "<a-right>",
  ":vert resize -5<cr>",
  "Window",
  "resize_window_right",
  "Decrease window vertical size by 5")

mapper(
  "n",
  "<a-up>",
  ":resize -5<cr>",
  "Window",
  "resize_window_up",
  "Increase window horizontal size by 5")

mapper(
  "n",
  "<a-down>",
  ":resize +5<cr>",
  "Window",
  "resize_window_down",
  "Decrease window horizontal size by 5")

mapper(
  "n",
  "<c-j>",
  ":cnext<esc>zz",
  "Quickfix List",
  "quickfix_next",
  "Go to next quickfix item")

mapper(
  "n",
  "<c-k>",
  ":cprev<esc>zz",
  "Quickfix List",
  "quickfix_prev",
  "Go to previous quickfix item")

mapper(
  "n",
  "<leader>ww",
  ":VimwikiIndex<cr>",
  "vimwiki",
  "vimwiki_index",
  "Open vimwiki index file")


mapper(
  "n",
  "<leader>p",
  ":exec ':AsyncRun zathura ' . expand('%:r') . '.pdf &'<cr>",
  "File opener",
  "open_pdf",
  "Open pdf file using zathura")

mapper(
  "n",
  "<c-n>",
  ":Ex<cr>",
  "Netrw",
  "open_netrw",
  "Open netrw")

mapper(
  "n",
  "<leader>bs",
  ":e /tmp/vim-scratch<cr>",
  "Buffer",
  "open_scratch_buffer",
  "Open scratch buffer")



return M
