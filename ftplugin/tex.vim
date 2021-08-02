let g:vimtex_grammar_vlty = { 'lt_command': 'languagetool'}
let g:vimtex_compiler_latexmk = {
			\ 'executable': '/usr/bin/latexmk',
			\}

let g:vimtex_quickfix_mode = 2
let g:vimtex_quickfix_ignore_filters = [
			\'Overfull',
			\'Underfull',
			\'LaTeX Warning:',
			\]


let g:tex_flavor = 'latex'
let g:vimtex_quickfix_open_on_warning = 0


setlocal thesaurus+=~/.config/nvim/thesaurus/mthesaur.txt
setlocal dictionary+=~/.config/nvim/thesaurus/mthesaur.txt
setlocal complete+=s
let localleader='\'
