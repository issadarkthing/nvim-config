let g:vimwiki_list = [{'path': '~/.local/share/nvim/vimwiki', 
					\ 'path_html': '~/.local/share/nvim/vimwiki/html'}]
let g:vimwiki_hl_headers = 1
let g:vimwiki_hl_cb_checked = 1

" remove tab delay
let g:vimwiki_key_mappings =
			\ {
			\ 'table_mappings': 0,
			\ }

" change vim wiki heading colors
highlight VimwikiHeader1 ctermfg=3
highlight VimwikiHeader2 ctermfg=2
highlight VimwikiHeader3 ctermfg=1
highlight VimwikiHeader4 ctermfg=6
highlight VimwikiHeader5 ctermfg=28
highlight VimwikiHeader6 ctermfg=130

" makes formatted block prettier
let g:vimwiki_conceal_pre = 1
