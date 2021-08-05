
-- leader key
vim.g.mapleader = ","

require('plugins')
require('plugin/telescope')
require('ftplugin/typescript')
require('mappings')
require('commands')
require('options')

vim.cmd[[filetype plugin indent on]]
vim.cmd[[colorscheme rex]]

-- auto compile after changing plugins.lua file
vim.cmd([[autocmd BufWritePost plugins.lua source <afile> | PackerCompile]])

-- semicolon macro
vim.cmd[["@s=A;jk"]]
-- assembly syntax
vim.g.asmsyntax = "nasm"

vim.cmd[[
  " opens help window vertically
  cabbrev h vert h
  " auto center for next and prev occurance
  cabbrev cn cn | normal zz
  cabbrev cp cn | normal zz


  " fix coc error message issue
  highlight Error ctermbg=black
  highlight Sneak ctermfg=0 ctermbg=6
]]
