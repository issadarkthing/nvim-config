vim.b.vimwiki_list = {
  { 
    path = '~/.local/share/nvim/vimwiki', 
    path_html = '~/.local/share/nvim/vimwiki/html'
  }
}

vim.b.vimwiki_hl_headers = true
vim.b.vimwiki_hl_cb_checked = true

--remove tab delay
vim.b.vimwiki_key_mappings = { table_mappings = 0 }

--change vim wiki heading colors
vim.cmd[[
  highlight VimwikiHeader1 ctermfg=3
  highlight VimwikiHeader2 ctermfg=2
  highlight VimwikiHeader3 ctermfg=1
  highlight VimwikiHeader4 ctermfg=6
  highlight VimwikiHeader5 ctermfg=28
  highlight VimwikiHeader6 ctermfg=130
]]

--makes formatted block prettier
vim.b.vimwiki_conceal_pre = 1

require'cmp'.setup{
  sources = {
    { name = 'look' },
    { name = 'buffer' },
  }
}
