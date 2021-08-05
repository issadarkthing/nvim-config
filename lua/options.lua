
vim.o.softtabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true
vim.o.number = true
-- enable mouse
vim.o.mouse = 'a'
-- autocompletion
vim.o.wildmenu = true
vim.o.wildmode = 'longest:full,full'
-- persistent undo history in one directory
vim.o.undofile = true
-- Use case insensitive search, except when using capital letters
vim.o.ignorecase = true
-- Horizontal splits will automatically be below
vim.o.splitbelow = true
-- Vertical splits will automatically be to the right
vim.o.splitright = true
-- makes popup menu smaller
vim.o.pumheight = 10
vim.o.scrolloff = 10
vim.o.textwidth = 80
-- switch between buffer without saving
vim.o.hidden = true
-- remove wrap
vim.o.wrap = false
-- Don't pass messages to |ins-completion-menu|.
vim.o.shortmess = 'aFc'
-- Having longer updatetime (default is 4000 ms  =  4 s) leads to noticeable
-- delays and poor user experience.
vim.o.updatetime = 300
-- time out on mapping after three seconds, time out on key codes after a tenth of a second
vim.o.timeout = true
vim.o.timeoutlen = 3000 
vim.o.ttimeoutlen = 100
-- show border to not exceed 80 characters
vim.o.colorcolumn = '81'
-- auto-wrap text using textwidth
vim.o.formatoptions = 't'
vim.o.spelllang = 'en_gb'
vim.o.relativenumber = true
vim.o.hlsearch = true
vim.o.incsearch = true
