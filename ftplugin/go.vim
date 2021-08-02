nnoremap <silent> <leader>a :GoAlternate<cr>
nnoremap <silent> <leader>t :GoTest<cr>
nnoremap <silent> <leader>gt :GoDeclsDir<cr>
nnoremap <silent> <leader>gi :GoImports<cr>
nnoremap <silent> <leader>gf :GoFmt<cr>


" -------------- vim-go config ---------
" disable vim-go doc
let g:go_doc_keywordprg_enabled = 0

" Highlight commonly used library types (`io.Reader`, etc.). >
let g:go_highlight_extra_types = 1


let g:go_highlight_operators           = 1
let g:go_highlight_functions           = 1
let g:go_highlight_function_parameters = 1
let g:go_highlight_function_calls      = 1
let g:go_highlight_types               = 1
let g:go_highlight_diagnostic_errors   = 1
let g:go_highlight_diagnostic_warnings = 1
let g:go_highlight_fields              = 1


let g:go_highlight_diagnostic_errors = 0
let g:go_code_completion_enabled     = 0
let g:go_imports_autosave            = 0
let g:go_fmt_autosave                = 0
let g:go_doc_popup_window            = 0
let g:go_gopls_enabled               = 1
