local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
  execute 'packadd packer.nvim'
end

return require('packer').startup(function ()

  -- adds surround text object
  use { 'tpope/vim-surround' }

  -- comment
  use 'b3nj5m1n/kommentary'

  -- color highlight
  use {'chrisbra/colorizer', opt = true, cmd = { 'ColorHighlight' }}

  -- Vim sugar for the UNIX shell commands that need it the most
  -- example: :Delete, :Move, :Rename, :Mkdir etc
  use 'tpope/vim-eunuch'

  -- highlight unique character in every word
  use 'unblevable/quick-scope'

  -- personal wiki for vim
  use {'vimwiki/vimwiki', opt = true, cmd = { 'VimwikiIndex' }}

  -- handles gpg encrypted file
  use 'jamessan/vim-gnupg'

  -- add more text object
  use 'wellle/targets.vim'

  -- vim latex
  use { 'lervag/vimtex', opt = true, ft = 'latex' }

  -- grammar check as well
  use 'dpelle/vim-LanguageTool'

  -- replace a existing text from the register
  use 'inkarkat/vim-ReplaceWithRegister' 

  -- auto reload if file has been modified from external
  -- as if you insert :e! manually
  use 'djoshea/vim-autoread'

  -- help to manage alignment
  use 'junegunn/vim-easy-align'

  -- for clojure
  -- Plug 'tpope/vim-fireplace'
  use { 'vim-scripts/paredit.vim', opt = true, ft = 'clojure' }
  use { 
    'eraserhd/parinfer-rust', 
    run = 'cargo build --release', 
    ft = 'clojure', opt = true
  }

  -- personal colorscheme
  use 'issadarkthing/vim-rex'

  -- benchmarking startup time
  use 'tweekmonster/startuptime.vim'
  -- use 'antoinemadec/FixCursorHold.nvim'

  -- cool markdown preview
  use { 
    'iamcco/markdown-preview.nvim', 
    ft = {"markdown"},
    run = 'cd app && yarn install'  
  }

  -- haskell syntax highlighting
  use { 'neovimhaskell/haskell-vim', opt = true, ft = 'haskell' }

  -- additional cpp syntax highlighting
  use 'octol/vim-cpp-enhanced-highlight'

  -- crystal language syntax highlighting
  use { 'vim-crystal/vim-crystal', opt = true, ft = 'crystal' }

  -- add readline keybinding in command
  use 'ryvnf/readline.vim'

  -- auto close pair for latex
  use 'gi1242/vim-tex-autoclose'

  -- better typescript highlighting
  -- use { 'leafgarland/typescript-vim', opt = true, ft = 'typescript' }

  -- comments in json file
  use { 'neoclide/jsonc.vim', opt = true, ft = 'jsonc' }

  -- typescript/javascript formatter
  use { 
    'prettier/vim-prettier', 
    opt = true, ft = {'typescript', 'typescriptreact'},
    run = {'yarn install'}
  }

  -- run lazygit in neovim
  use { 
    'kdheepak/lazygit.nvim', 
    opt = true, branch = 'nvim-v0.4.3',
    cmd = {"LazyGit"}
  }

  -- automatically disable nohlsearch
  use 'romainl/vim-cool'

  -- helper commands to develop vim plugin
  use 'tpope/vim-scriptease'

  -- might use this instead of calcurse because vim is life
  use 'itchyny/calendar.vim'

  -- react dev
  use { 'peitalin/vim-jsx-typescript', opt = true, ft = 'typescriptreact' }
  use { 'alvan/vim-closetag', opt = true, ft = 'typescriptreact' }
  use { 'tpope/vim-ragtag', opt = true, ft = 'typescriptreact' }

  -- keybinding finder
  use {
    'lazytanuki/nvim-mapper',
    requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}},
  }

  -- finder
  use { 
    'nvim-telescope/telescope.nvim', 
    requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}},
    config = function() require'plugin/telescope'.setup() end
  }

  -- fuzzy searching written in c
  use 'nvim-telescope/telescope-fzy-native.nvim'

  -- fast status line written in lua
  use {
    'NTBBloodbath/galaxyline.nvim',
    -- your statusline
    config = function() require'plugin/galaxyline' end,
    -- some optional icons
    requires = {'kyazdani42/nvim-web-devicons', opt = true}
  }

  -- native LSP
  use { 
    'neovim/nvim-lspconfig',
    config = function() require'plugin/nvim-lsp'.setup() end
  }

  -- better ui for LSP
  --[[ use {
    'glepnir/lspsaga.nvim',
    config = function() require'plugin/lspsaga'.setup() end
  } ]]


  -- auto pair
  use {
    'windwp/nvim-autopairs',
    config = function() require'plugin/nvim-autopairs'.setup() end,
  }

  -- auto completion
  use {
    'ms-jpq/coq_nvim',
    branch = 'coq',
    config = function() require'plugin/coq_nvim'.setup() end
  }

  use 'leafgarland/typescript-vim'  

  use 'tomlion/vim-solidity'

end)
