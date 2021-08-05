vim.b.vimtex_grammar_vlty = { lt_command = 'languagetool'}
vim.b.vimtex_compiler_latexmk = { executable = '/usr/bin/latexmk' }

vim.b.vimtex_quickfix_mode = 2
vim.b.vimtex_quickfix_ignore_filters = { 'Overfull', 'Underfull', 'LaTeX Warning:' }


vim.b.tex_flavor = 'latex'
vim.b.vimtex_quickfix_open_on_warning = 0


vim.bo.thesaurus:append{ ~/.config/nvim/thesaurus/mthesaur.txt }
vim.bo.dictionary:append{ ~/.config/nvim/thesaurus/mthesaur.txt }
vim.bo.complete:append{ 's' }
vim.bo.localleader = [[\]]

