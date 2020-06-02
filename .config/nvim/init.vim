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
Plug 'neoclide/coc.nvim', {'branch': 'release'}
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
Plug 'autozimu/LanguageClient-neovim', {'branch': 'next', 'do': 'bash install.sh'}
call plug#end()

" -------
" General
" -------

" Enable SYNTAX.
syntax on

" Display line number.
set number
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
" Set smart indent.
set smartindent
" Highlight match brackets.
set showmatch
" Enable cmd-line completion.
set wildmode=list:longest
" Enable soft tab.
set expandtab
" Enhance search.
set ignorecase
set smartcase
set incsearch
set wrapscan
set hlsearch

" Wrap support.
nnoremap j gj
nnoremap k gk

" Auto close tag in HTML/XML.
augroup MyXML
  autocmd!
  autocmd Filetype xml inoremap <buffer> </ </<C-x><C-o>
  autocmd Filetype html inoremap <buffer> </ </<C-x><C-o>
augroup END

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

" End of file
