" ~/.config/nvim/vim-plug/plugins.vim
"
" © 2020 Potato1682.
" Discord: Potato1682#9684
" Email: contact@potato1682.ml
"

" Install plug.vim automatically
if empty(glob('~/.config/nvim/autoload/plug.vim')) && has("autocmd")
  silent !curl -fLo '~/.config/nvim/autoload/plug.vim' --create-dirs
    \ 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Speicfy a directory for plugins
call plug#begin('~/.config/nvim/plugged')

" Designs
Plug 'christianchiarulli/nvcode-color-schemes.vim' " For nvim-treesitter colors
Plug 'rakr/vim-one'                                " For one-light theme
Plug 'itchyny/lightline.vim'                       " For a beautiful status line
Plug 'josa42/vim-lightline-coc'                    " Lightline integration for coc
Plug 'ryanoasis/vim-devicons'                      " For nerd icons
Plug 'nathanaelkane/vim-indent-guides'             " Show indentation line
Plug 'junegunn/goyo.vim'                           " For nice development
Plug 'junegunn/rainbow_parentheses.vim'            " For rainbow parentheses
Plug 'kyazdani42/nvim-web-devicons'                " Required by romgrk/barbar.nvim
Plug 'romgrk/barbar.nvim'                          " For vscode-like bufferline
Plug 'nvim-treesitter/nvim-treesitter'             " Treesitter syntax highlighting
Plug 'machakann/vim-highlightedyank'               " Make the yanked region apparent
Plug 'mg979/vim-visual-multi'                      " Multi visual selection
Plug 'sheerun/vim-polyglot'                        " Better syntax support

" Windows
Plug 'liuchengxu/vista.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'liuchengxu/vim-which-key', { 'on': [ 'WhichKey', 'WhichKey!' ] }
Plug 'mhinz/vim-startify'

" System plugins
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'airblade/vim-rooter'
Plug 'tpope/vim-fugitive'
Plug 'preservim/nerdcommenter'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'floobits/floobits-neovim'
Plug 'alvan/vim-closetag'
Plug 'terryma/vim-expand-region'
Plug 'gko/vim-coloresque'
Plug 'raimon49/requirements.txt.vim', { 'for': 'requirements' }
Plug 'tpope/vim-endwise'
Plug 'editorconfig/editorconfig-vim'
Plug 'unblevable/quick-scope'
Plug 'psliwka/vim-smoothie'
Plug 'moll/vim-bbye'
Plug 'metakirby5/codi.vim'
Plug 'tpope/vim-sleuth'
Plug 'AndrewRadev/tagalong.vim'
Plug 'brooth/far.vim'
Plug 'dhruvasagar/vim-table-mode'
Plug 'kana/vim-operator-user'
Plug 'kana/vim-operator-replace'
Plug 'emonkak/vim-operator-sort'
Plug 'unblevable/quick-scope'
Plug 'easymotion/vim-easymotion'
Plug 'junegunn/vim-easy-align'
Plug 'skywind3000/asynctasks.vim'
Plug 'skywind3000/asyncrun.vim'
Plug 'Yggdroot/indentLine'

" Initialize plugin system
call plug#end()

" Automatically install missing plugins on startup
if has("autocmd")
  autocmd VimEnter *
    \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
    \|   PlugInstall --sync | q
    \| endif
endif

