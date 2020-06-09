" ~/.config/nvim/init.vim
"
" ©Potato1682.
" Discord: Potato1682#9684
" Email: contact@potato1682.ml
"
" This file required vim, neovim(cleared checkhelath) and vim-plug.
"

" -------
" Plugins
" -------

" Import all plugins by use vim-plug.
call plug#begin('~/.vim/plugged')
if has('nvim')
        Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins'  }
else
        Plug 'Shougo/deoplete.nvim'
        Plug 'roxma/nvim-yarp'
        Plug 'roxma/vim-hug-neovim-rpc'
endif
Plug 'joshdick/onedark.vim'
Plug 'itchyny/lightline.vim'
Plug 'ntpeters/vim-better-whitespace'
Plug 'Yggdroot/indentLine'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'majutsushi/tagbar', { 'on': 'TagbarToggle' }
Plug 'airblade/vim-rooter'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'xuyuanp/nerdtree-git-plugin', { 'on': 'NERDTreeToggle' }
Plug 'sheerun/vim-polyglot'
Plug 'dense-analysis/ale'
Plug 'maximbaz/lightline-ale'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'kassio/neoterm'
Plug 'tpope/vim-commentary'
Plug 'mbbill/undotree'
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'jiangmiao/auto-pairs'
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'mattn/vim-lsp-icons'
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'
Plug 'floobits/floobits-neovim'
Plug 'thinca/vim-quickrun'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'pangloss/vim-javascript'
Plug 'autozimu/LanguageClient-neovim', { 'branch': 'next', 'do': 'bash install.sh' }
Plug 'mattn/emmet-vim'
Plug 'dhruvasagar/vim-table-mode'
Plug 'ryanoasis/vim-devicons'
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'alvan/vim-closetag'
Plug 'terryma/vim-expand-region'
Plug 'yuttie/comfortable-motion.vim'
Plug 'junegunn/goyo.vim'
Plug 'Shougo/unite.vim'
Plug 'Shougo/neomru.vim'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-endwise'
Plug 'vim-scripts/AnsiEsc.vim'
Plug 'vim-scripts/DrawIt'
Plug 'thinca/vim-prettyprint'
call plug#end()

" -------
" General
" -------

" Enable SYNTAX.
syntax on

" Display line number.
set number
" Show file name.
set title
" Set 'vim' encoding.
set encoding=UTF-8
" Optimize terminal color.
set termguicolors
" Enable mouse support.
set mouse=a
" Do not show ---INSERT---.
set laststatus=2
" Do not show status bars.
set noshowmode
" Do not beep!
set noerrorbells
" Auto read again when file changed.
set autoread
" Show input command in status bar.
set showcmd
" Show cursor highlight line.
set cursorline
" Can move as eol. this is so BENRI.
set virtualedit=onemore
" Set auto indent.
set autoindent
" Set smart indent.
set smartindent
" Highlight match brackets.
set showmatch
" Enable cmd-line completion.
set wildmenu
" Enable soft tab.
set expandtab
" Enhance search.
set ignorecase
set smartcase
set incsearch
set wrapscan
set hlsearch
" Raw paste. THIS IS SO KAMI.
set paste
" Do not create swap file.
set noswapfile

" Wrap support.
nnoremap j gj
nnoremap k gk
noremap! <Down> gj
noremap! <Up>   gk

" Insert arrow keys move support.
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-h> <Left>
inoremap <C-l> <Right>

" Nihongo support.
nnoremap あ a
nnoremap い i
nnoremap う u
nnoremap お o
nnoremap ｄｄ dd
nnoremap ｙｙ yy

" Save cursor point.
if has("autocmd")
  augroup redhat
    " In text files, always limit the width of text to 78 characters
    autocmd BufRead *.txt set tw=78
    " When editing a file, always jump to the last cursor position
    autocmd BufReadPost *
    \ if line("'\"") > 0 && line ("'\"") <= line("$") |
    \   exe "normal! g'\"" |
    \ endif
  augroup END
endif

" Save undo with quiting.
if has('persistent_undo')
        let undo_path = expand('~/.vim/undo')
        exe 'set undodir=' .. undo_path
        set undofile
endif

" ---------------
" Plugin Settings
" ---------------

" airblade/vim-gitgutter
set updatetime=100

" joshdick/onedark.vim
colorscheme onedark

" itchyny/lightline.vim
let g:lightline = {'colorscheme': 'onedark'}

" scrooloose/nerdtree
nmap <C-e> :NERDTreeToggle<CR><S-i>

" majutsushi/tagbar
nmap <F8> :TagbarToggle<CR>

" dense-analysis/ale
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
let g:ale_set_highlights = 0
let g:ale_linters = {'python': ['flake8']}
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_fixers = {
  \   '*': ['remove_trailing_lines', 'trim_whitespace'],
  \   'python': ['black'],
  \ }
let g:lightline = {
  \ 'colorscheme': 'onedark',
  \ 'separator': { 'left': "\ue0b0", 'right': "\ue0b2"  },
  \ 'subseparator': { 'left': "\ue0b1", 'right': "\ue0b3"  }
  \ }
let g:lightline.component_expand = {
  \   'linter_checking': 'lightline#ale#checking',
  \   'linter_warnings': 'lightline#ale#warnings',
  \   'linter_errors': 'lightline#ale#errors',
  \   'linter_ok': 'lightline#ale#ok',
  \ }
let g:lightline.component_type = {
  \   'linter_checking': 'left',
  \   'linter_warnings': 'warning',
  \   'linter_errors': 'error',
  \   'linter_ok': 'left',
  \ }
let g:lightline.active = {
  \   'left': [
  \     ['mode', 'paste'],
  \     ['readonly', 'filename', 'modified'],
  \     ['linter_checking', 'linter_errors', 'linter_warnings', 'linter_ok'],
  \   ]
  \ }
let g:ale_fix_on_save = 1
let g:ale_sign_error = ''
let g:ale_sign_warning = ''
let g:airline#extensions#ale#open_lnum_symbol = '('
let g:airline#extensions#ale#close_lnum_symbol = ')'
let g:ale_echo_msg_format = '[%linter%]%code: %%s'
highlight link ALEErrorSign Tag
highlight link ALEWarningSign StorageClass

" neoclide/coc.nvim
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1]  =~# '\s'
endfunction
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
	if (index(['vim','help'], &filetype) >= 0)
		execute 'h '.expand('<cword>')
	else
		call CocAction('doHover')
	endif
endfunction

" kassio/neoterm
let g:neoterm_default_mod='belowright'
let g:neoterm_size=10
let g:neoterm_autoscroll=1
tnoremap <silent> <C-w> <C-\><C-n><C-w>
nnoremap <silent> <C-n> :TREPLSendLine<CR>j0
vnoremap <silent> <C-n> V:TREPLSendSelection<CR>'>j0

" mbbill/undotree
nmap <F5> :UndotreeToggle<CR>

" easymotion/vim-easymotion
nmap s <Plug>(easymotion-overwin-f2)

" pangloss/vim-javascript
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1
let g:javascript_plugin_flow = 1
let g:javascript_conceal_function             = "ƒ"
let g:javascript_conceal_null                 = "ø"
let g:javascript_conceal_this                 = "@"
let g:javascript_conceal_return               = "⇚"
let g:javascript_conceal_undefined            = "¿"
let g:javascript_conceal_NaN                  = "ℕ"
let g:javascript_conceal_prototype            = "¶"
let g:javascript_conceal_static               = "•"
let g:javascript_conceal_super                = "Ω"
let g:javascript_conceal_arrow_function       = "⇒"

map <leader>l :exec &conceallevel ? "set conceallevel=0" : "set conceallevel=1"<CR>

" Shougo/deoplete.nvim
let g:deoplete#enable_at_startup = 1

" dhruvasagar/vim-table-mode
let g:table_mode_corner = '|'

" prettier/vim-prettier
let g:prettier#autoformat = 1
let g:prettier#autoformat_require_pragma = 0
let g:prettier#exec_cmd_async = 1
let g:prettier#quickfix_auto_focus = 0

" terryma/vim-expand-region
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

" kana/vim-operator-replace
map _ <Plug>(operator-replace)

autocmd BufNewFile,BufRead *.fs,*.fsi,*.fsx

setlocal filetype=fsharp

" fsharp-language-server
let s:pathFslangServer = '~/Projects/fsharp-language-server/src/FSharpLanguageServer/bin/Release/netcoreapp2.0/FSharpLanguageServer.dll'

" LanguageClient-neovim
let g:LanguageClient_autoStart = 1
let g:LanguageClient_serverCommands = {'fsharp': ['dotnet', s:pathFslangServer ] }
nmap <silent> <nowait><Leader>d :call LanguageClient#textDocument_definition()<CR>
nmap <silent> <nowait> K :call LanguageClient#textDocument_hover()<CR>

" End of file
