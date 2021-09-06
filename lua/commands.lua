local cmd = vim.cmd

function strip_whitespace()
  vim.api.nvim_command[[%s/\s\+$//e]]
end

cmd [[
  function! Compile_rmd()
    let l:file = expand('%')
    let l:file_name = expand('%:r')
    let l:compile_cmd = "Rscript -e \"rmarkdown::render('" . file . "', output_file='" . file_name . ".pdf')\""
    exec ':AsyncRun ' . l:compile_cmd
  endfunction
]]

cmd [[
  " deletes trailing whitespace while preserving cursor
  function! StripTrailingWhitespaces()
      let l = line(".")
      let c = col(".")
      %s/\s\+$//e
      call cursor(l, c)
  endfun
]]

cmd [[
  function! GrammarMappings()
    nmap <buffer> <leader>, <Plug>(grammarous-fixit)
    nmap <buffer> <leader>n <Plug>(grammarous-move-to-next-error)
    nmap <buffer> <leader>p <Plug>(grammarous-move-to-previous-error)
    " Disable the grammar rule under the cursor
    nmap <buffer> <leader>d <Plug>(grammarous-remove-error)
    nmap <buffer> <leader>r <Plug>(grammarous-reset)
    nmap <buffer> <leader>a <Plug>(grammarous-fixall)
    nmap <buffer> <leader>q <Plug>(grammarous-close-info-window)
    nmap <buffer> <leader>i <Plug>(grammarous-open-info-window)
    nnoremap <buffer> <leader>c vip:GrammarousCheck<cr>
  endfunction
]]

cmd [[
  function! ReplaceTabWithSpace()
      set tabstop=4 shiftwidth=4 expandtab
      retab
  endfunction

  command! ReplaceTab call ReplaceTabWithSpace()
]]


cmd [[
  " auto commands
  " group commands together to prevent calling autocmd whenever file is reloaded
  augroup personal_preference
    autocmd!
    " vertically center document when entering insert mode
    autocmd InsertEnter * norm zz

    " automatic shebang insertion
    autocmd BufNewFile *.sh 0put = '#!/bin/bash'

    " disable auto pair for lisp and clojure files
    autocmd FileType clojure let b:autopairs_loaded=1 

    " use clojure syntax for spirit lang
    autocmd BufNewFile,BufRead *.st setlocal filetype=clojure | let b:autopairs_enabled=0

    autocmd BufRead,BufNewFile *.txt call GrammarMappings()

    " auto format characters to textwidth limit
    " autocmd FileType tex setlocal formatoptions+=t

    " use spaces instead of tab for haskell
    autocmd FileType haskell call ReplaceTabWithSpace()

    autocmd FileType tex call GrammarMappings()
    autocmd BufNewFile,BufRead *.wiki call GrammarMappings()
    autocmd BufNewFile,BufRead *.Rmd call GrammarMappings()

    " allow comments in tsconfig
    autocmd BufRead,BufNewFile tsconfig.json set filetype=jsonc

    autocmd BufWritePost *.Rmd call Compile_rmd()

    " restore previos cursor position
    autocmd BufReadPost * if line("'\"") | execute("normal `\"") | endif

  augroup END
]]
