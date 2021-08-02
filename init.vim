
" plugins
call plug#begin('~/.config/nvim/autoload/plugged')

" manages quoting/parenthesis
Plug 'tpope/vim-surround'

" status bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" insert, or delete brackets, parens, quotes in pair
Plug 'jiangmiao/auto-pairs'

" comment
Plug 'tpope/vim-commentary'

" color highlight
Plug 'chrisbra/colorizer', { 'on': 'ColorHighlight' }

" Vim sugar for the UNIX shell commands that need it the most
" example: :Delete, :Move, :Rename, :Mkdir etc
Plug 'tpope/vim-eunuch'

" fuzzyfind stuff
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" highlight unique character in every word
Plug 'unblevable/quick-scope'

" personal wiki for vim
Plug 'vimwiki/vimwiki', { 'on': 'VimwikiIndex' }

" handles gpg encrypted file
Plug 'jamessan/vim-gnupg'

" add more text object
Plug 'wellle/targets.vim'

" reorder delimited items
Plug 'machakann/vim-swap'

" grammar check
Plug 'rhysd/vim-grammarous'

" code completion
Plug 'neoclide/coc.nvim', { 
            \ 'branch': 'master', 
            \ 'do': 'yarn install --frozen-lockfile' }

" native LSP colorscheme
" Plug 'folke/lsp-colors.nvim'


" vim latex
Plug 'lervag/vimtex', { 'for': 'latex' }

" grammar check as well
Plug 'dpelle/vim-LanguageTool'

" go debugger
Plug 'sebdah/vim-delve', { 'for': 'go' }

" replace a existing text from the register
Plug 'inkarkat/vim-ReplaceWithRegister' 

" auto reload if file has been modified from external
" as if you insert :e! manually
Plug 'djoshea/vim-autoread'

" go plugin
" Plug 'fatih/vim-go', { 'for': 'go' }

" help to manage alignment
Plug 'junegunn/vim-easy-align'

" for clojure
" Plug 'tpope/vim-fireplace'
Plug 'vim-scripts/paredit.vim', { 'for': 'clojure' }

Plug 'eraserhd/parinfer-rust', {
			\ 'do': 'cargo build --release',
			\ 'for': 'clojure'}


" personal colorscheme
Plug 'issadarkthing/vim-rex'

" benchmarking startup time
Plug 'tweekmonster/startuptime.vim'
Plug 'antoinemadec/FixCursorHold.nvim'

" show git marks
Plug 'airblade/vim-gitgutter'

" cool markdown preview
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }

" haskell syntax highlighting
Plug 'neovimhaskell/haskell-vim', { 'for': 'haskell' }

" additional cpp syntax highlighting
Plug 'octol/vim-cpp-enhanced-highlight'

" crystal language syntax highlighting
Plug 'vim-crystal/vim-crystal', { 'for': 'crystal' }

" add readline keybinding in command
Plug 'ryvnf/readline.vim'

Plug 'gi1242/vim-tex-autoclose'

" better typescript highlighting
Plug 'leafgarland/typescript-vim', { 'for': 'typescript' }

" comments in json file
Plug 'neoclide/jsonc.vim'

" " Plug 'vim-pandoc/vim-pandoc'
" " Plug 'vim-pandoc/vim-pandoc-syntax'
" " Plug 'vim-pandoc/vim-rmarkdown'

Plug 'skywind3000/asyncrun.vim'

Plug 'prettier/vim-prettier', { 'for': ['typescript', 'typescriptreact'] }

" run lazygit in neovim
Plug 'kdheepak/lazygit.nvim', { 'branch': 'nvim-v0.4.3' }

" centers your text
Plug 'junegunn/goyo.vim', { 'on': 'Goyo' }

" automatically disable nohlsearch
Plug 'romainl/vim-cool'

" helper commands to develop vim plugin
Plug 'tpope/vim-scriptease'

" might use this instead of calcurse because vim is life
Plug 'itchyny/calendar.vim'

Plug 'peitalin/vim-jsx-typescript'

Plug 'alvan/vim-closetag'

Plug 'tpope/vim-ragtag'

Plug 'justinmk/vim-sneak'

Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'

call plug#end()


" options
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set number
" enables mouse
set mouse+=a
" disable highlight search permanently
set nohlsearch
" autocompletion
set wildmenu
set wildmode=longest:full,full
" persistent undo history in one directory
set undofile
" Use case insensitive search, except when using capital letters
set ignorecase
" Horizontal splits will automatically be below
set splitbelow
" Vertical splits will automatically be to the right
set splitright
" makes popup menu smaller
set pumheight=10
set scrolloff=10
set textwidth=80
" switch between buffer without saving
set hidden
" remove wrap
set nowrap
" Don't pass messages to |ins-completion-menu|.
set shortmess=aFc
" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300
" time out on mapping after three seconds, time out on key codes after a tenth of a second
set timeout timeoutlen=3000 ttimeoutlen=100
" show border to not exceed 80 characters
set colorcolumn=81
" auto-wrap text using textwidth
set formatoptions+=t
set spelllang=en_gb
set relativenumber
set hlsearch
set incsearch
set shada='10,\"100,:20,%,n~/.config/nvim/viminfo

let mapleader = ","
filetype plugin indent on
colorscheme rex

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



function! Compile_rmd()
	let l:file = expand('%')
	let l:file_name = expand('%:r')
	let l:compile_cmd = "Rscript -e \"rmarkdown::render('" . file . "', output_file='" . file_name . ".pdf')\""
	exec ':AsyncRun ' . l:compile_cmd
endfunction



" the most important keybinding for me
" remap esc key as jk
inoremap jk <esc>
inoremap JK <esc>

" source vimrc
noremap <leader>v :so ~/.config/nvim/init.vim<cr>

" semicolon macro
let @s="A;jk"


" disables arrow keys
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>


" automatic center when jump to next or previous position
noremap <silent> <C-o> <C-o>zz
noremap <silent> <C-i> <C-i>zz

" remap escape key to exit fzf
if &filetype == "fzf" || &filetype == "lazygit"
	tnoremap <buffer> <Esc> <c-\><c-n>
endif

" remap annoying typo
nnoremap q: :q<CR>

" add relative line jump to jump list
nnoremap <expr> k (v:count > 1 ? "m'" . v:count : '') . 'gk'
nnoremap <expr> j (v:count > 1 ? "m'" . v:count : '') . 'gj'

" mapping to make movements operate on 1 screen line in wrap mode
function! ScreenMovement(movement)
   if &wrap
      return "g" . a:movement
   else
      return a:movement
   endif
endfunction

onoremap <silent> <expr> j ScreenMovement("j")
onoremap <silent> <expr> k ScreenMovement("k")
onoremap <silent> <expr> 0 ScreenMovement("0")
onoremap <silent> <expr> ^ ScreenMovement("^")
onoremap <silent> <expr> $ ScreenMovement("$")
nnoremap <silent> <expr> j ScreenMovement("j")
nnoremap <silent> <expr> k ScreenMovement("k")
nnoremap <silent> <expr> 0 ScreenMovement("0")
nnoremap <silent> <expr> ^ ScreenMovement("^")
nnoremap <silent> <expr> $ ScreenMovement("$")



" opens help window vertically
cabbrev h vert h
" auto center for next and prev occurance
cabbrev cn cn | normal zz
cabbrev cp cn | normal zz


" edit config
nnoremap <silent> <leader>ec :e ~/.config/nvim/init.vim<cr>

" closes buffer
nnoremap <silent> <leader>bd :bd<cr>

" deletes all buffer except current one
noremap <silent> <leader>bo :%bd!\|e#\|bd#<cr>\|'"

" go to most recent buffer
noremap <silent> <A-w> :b#<CR>

" navigate between windows
nnoremap <silent> <A-l> <C-w>l
nnoremap <silent> <A-h> <C-w>h
nnoremap <silent> <A-j> <C-w>j
nnoremap <silent> <A-k> <C-w>k

" delete a function if opening brace is on the same line as function name
nnoremap <leader>df Vf{%d

" scratch buffer
nnoremap <silent> <leader>bs :e /tmp/vim-scratch<cr>

" deletes trailing whitespace while preserving cursor
function! StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun



" navigate trough quickfix list
nnoremap <silent><leader>cn :cnext<esc>zz
nnoremap <silent><leader>cp :cprev<esc>zz

function! GetBufferList()
  redir =>buflist
  silent! ls!
  redir END
  return buflist
endfunction

function! ToggleList(bufname, pfx)
  let buflist = GetBufferList()
  for bufnum in map(filter(split(buflist, '\n'), 'v:val =~ "'.a:bufname.'"'), 'str2nr(matchstr(v:val, "\\d\\+"))')
    if bufwinnr(bufnum) != -1
      exec(a:pfx.'close')
      return
    endif
  endfor
  if a:pfx == 'l' && len(getloclist(0)) == 0
      echohl ErrorMsg
      echo "Location List is Empty."
      return
  endif
  let winnr = winnr()
  exec(a:pfx.'open')
  if winnr() != winnr
    wincmd p
  endif
endfunction

" toggle quickfix and location list
nnoremap <silent> <c-l> :call ToggleList("Location List", 'l')<CR>
nnoremap <silent> <c-q> :call ToggleList("Quickfix List", 'c')<CR>


" Use tab for trigger completion with characters ahead and navigate.
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"


nnoremap <a-Left>  :vert resize +5<cr>
nnoremap <a-Right> :vert resize -5<cr>
nnoremap <a-Up>    :resize -5<cr>
nnoremap <a-Down>  :resize +5<cr>


" set current highlited on the correct window
" nnoremap <c-w>v <c-w>v<c-w>h



let g:asmsyntax = 'nasm'

nnoremap <leader>ep :e ~/Documents/scripts/prelude.clj<cr>
nnoremap <leader>bb :Buffers<cr>
nnoremap <M-`> <C-^>
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap m :silent w<cr>



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




function! ReplaceTabWithSpace()
    set tabstop=4 shiftwidth=4 expandtab
    retab
endfunction

command! ReplaceTab call ReplaceTabWithSpace()

nnoremap <leader>ww :VimwikiIndex<CR>

let s:term_window = -1
let s:term_buffer = -1
let s:term_job_id = -1

function! TerminalOpen()
  " Check if buffer exists, if not create a window and a buffer
  if !bufexists(s:term_buffer)
    " Creates a window call monkey_terminal
    new local_terminal

	" disable line numbers
	setlocal nonumber norelativenumber
    " Moves to the window the right the current one
    " wincmd L
    let s:term_job_id = termopen($SHELL, { 'detach': 1 })

     " Change the name of the buffer to "Terminal 1"
     silent file Terminal\ 1
     " Gets the id of the terminal window
     let s:term_window = win_getid()
     let s:term_buffer = bufnr('%')

    " The buffer of the terminal won't appear in the list of the buffers
    " when calling :buffers command
    set nobuflisted
  else
    if !win_gotoid(s:term_window)
    split
    " Moves to the window below the current one
    " wincmd L   
    buffer Terminal\ 1
     " Gets the id of the terminal window
     let s:term_window = win_getid()
    endif
  endif
  " be in insert mode immediately
  startinsert
endfunction

function! TerminalToggle()
  if win_gotoid(s:term_window)
	hide
  else
    call TerminalOpen()
  endif
endfunction

" toggle terminal window
nnoremap <silent> <C-z> :call TerminalToggle()<cr>
tnoremap <silent> <C-z> <C-\><C-n>:call TerminalToggle()<cr>

" open netrw
nnoremap <C-n> :Ex<cr>


" open pdf file of file
nnoremap <leader>p :exec ':AsyncRun zathura ' . expand('%:r') . '.pdf &'<cr>

nnoremap <c-l> :bnext<cr>
nnoremap <c-h> :bprev<cr>

nnoremap <silent> <leader>lz :LazyGit<cr>
nnoremap <silent> <leader>gy :Goyo<cr>

" fix coc error message issue
highlight Error ctermbg=black

let g:sneak#label = 1
highlight Sneak ctermfg=0 ctermbg=6

lua require('init')
