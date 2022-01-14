

vim.g.vimwiki_list = {
  {
    path = "~/.local/share/nvim/vimwiki",
    path_html = "~/.local/share/nvim/vimwiki/html",
  }
}

vim.g.vimwiki_hl_headers = 1
vim.g.vimwiki_hl_cb_checked = 1

-- remove tab delay
vim.g.vimwiki_key_mappings = { 
  table_mappings = 0,
  table_format = 0,
}
