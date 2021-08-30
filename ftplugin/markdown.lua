


vim.wo.spell = true
vim.bo.spelllang = "en_us"

require'cmp'.setup{
  sources = {
    { name = 'look' },
    { name = 'buffer' },
  }
}
