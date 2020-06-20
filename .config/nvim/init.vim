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
	Plug 'Shougo/denite.nvim', { 'do': ':UpdateRemotePlugins' }
 	Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
else
        Plug 'Shougo/deoplete.nvim'
	Plug 'Shougo/denite.nvim'
	Plug 'Shougo/defx.nvim'
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
Plug 'deoplete-plugins/deoplete-clang'
Plug 'Shougo/neoinclude.vim'
Plug 'sakhnik/nvim-gdb'
Plug 'lyuts/vim-rtags'
Plug 'Shougo/deoppet.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'kristijanhusak/defx-icons'
Plug 'kristijanhusak/defx-git'
Plug 'vim-scripts/a.vim'
Plug 'vim-jp/vim-cpp'
Plug 'vim-scripts/DoxygenToolkit.vim'
Plug 'vhdirk/vim-cmake'
Plug 'junegunn/vim-easy-align'
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'davidhalter/jedi-vim'
Plug 'raimon49/requirements.txt.vim', {'for': 'requirements'}
Plug 'arnaud-lb/vim-php-namespace'
Plug 'jelera/vim-javascript-syntax'
Plug 'hail2u/vim-css3-syntax'
Plug 'gorodinskiy/vim-coloresque'
Plug 'tpope/vim-haml'
Plug 'Valloric/YouCompleteMe'
Plug 'SirVer/ultisnips'
Plug 'othree/yajs.vim'
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

set signcolumn=yes

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

" davidhalter/jedi-vim
let g:jedi#popup_on_dot = 0
let g:jedi#goto_assignments_command = "<leader>g"
let g:jedi#goto_definitions_command = "<leader>d"
let g:jedi#documentation_command = "K"
let g:jedi#usages_command = "<leader>n"
let g:jedi#rename_command = "<leader>r"
let g:jedi#show_call_signatures = "0"
let g:jedi#completions_command = "<C-Space>"
let g:jedi#smart_auto_mappings = 0
let g:jedi#force_py_version = 3
autocmd FileType python setlocal completeopt-=preview

" junegunn/vim-easy-align
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" thinca/vim-quickrun
nnoremap <Leader>go :QuickRun<CR>
nnoremap <C-U>qr :QuickRun<CR>
let g:quickrun_config={'*': {'split': ''}}
let g:quickrun_config.cpp = {
        \   'command': 'g++',
        \   'cmdopt': '-std=c++11'
\ }

" mattn/emmet-vim
autocmd FileType html imap <buffer><expr><tab>
        \ emmet#isExpandable() ? "\<plug>(emmet-expand-abbr)" :
        \ "\<tab>"

" SirVer/ultisnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsSnippetDirectories=["~/vim-snippets/"]

" Valloric/YouCompleteMe
let g:ycm_server_python_interpreter = '/usr/bin/python2.7'
let g:ycm_python_binary_path = '/usr/bin/python2.7'
let g:ycm_global_ycm_extra_conf = '~/.vim/plugged/YouCompleteMe/.ycm_extra_conf.py'
let g:ycm_auto_trigger = 1
let g:ycm_min_num_of_chars_for_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_key_list_select_completion = ['<Down>']
let g:ycm_key_list_previous_completion = ['<Up>']
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "ᐅ"
let g:ycm_key_list_stop_completion = ['<C-y>', '<Enter>']
let g:ycm_seed_identifiers_with_syntax = 1
let g:SuperTabDefaultCompletionType = '<C-n>'
let g:make = 'gmake'
if exists('make')
    let g:make = 'make'
endif

" airblade/vim-gitgutter
set updatetime=100

" joshdick/onedark.vim
colorscheme onedark

" itchyny/lightline.vim
let g:lightline = {'colorscheme': 'onedark'}

" scrooloose/nerdtree
nmap <C-e> :Defx<CR>

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
let g:ale_sign_column_always = 1
let g:ale_sign_error = ''
let g:ale_sign_warning = ''
let g:airline#extensions#ale#open_lnum_symbol = '('
let g:airline#extensions#ale#close_lnum_symbol = ')'
let g:ale_echo_msg_format = '[%linter%]%code: %%s'
highlight link ALEErrorSign Tag
highlight link ALEWarningSign StorageClass
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_statusline_format = ['⨉ %d', '⚠ %d', '⬥ ok']
let g:ale_linters = {
        \   'c' : ['clangd'],
        \   'cpp' : ['clangd']
\}

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
inoremap <silent><expr> <TAB>
        \ pumvisible() ? "\<C-n>" :
        \ <SID>check_back_space() ? "\<TAB>" :
        \ deoplete#manual_complete()
function! s:check_back_space() abort
      	let col = col('.') - 1
     	 return !col || getline('.')[col - 1]  =~ '\s'
endfunction
inoremap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<C-h>"
inoremap <expr><C-e>       deoplete#cancel_popup()

call deoplete#custom#source('_', 'matchers', ['matcher_head'])
call deoplete#custom#source('_', 'converters', [
        \ 'converter_remove_paren',
        \ 'converter_remove_overlap',
        \ 'matcher_length',
        \ 'converter_truncate_abbr',
        \ 'converter_truncate_menu',
        \ 'converter_auto_delimiter',
        \ ])
call deoplete#custom#option('keyword_patterns', {
        \ '_': '[a-zA-Z_]\k*\(?',
        \ 'tex': '[^\w|\s][a-zA-Z_]\w*',
        \ })
call deoplete#custom#option('camel_case', v:true)

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

" deoplete-plugins/deoplete-clang
let g:deoplete#sources#clang#libclang_path = system("llvm-config --prefix")[:-2] . '/lib/libclang.dylib'
let g:deoplete#sources#clang#clang_header = system("llvm-config --prefix")[:-2] . '/lib/clang'
let g:deoplete#sources#clang#sort_algo = 'priority'
let g:deoplete#sources#clang#clang_complete_database="./build/"

" lyuts/vim-rtags
let g:rtagsUseDefaultMappings = 0
let g:rtagsAutoLaunchRdm = 1
noremap <leader>ri :call rtags#SymbolInfo()<CR>
noremap <Leader>rj :call rtags#JumpTo(g:SAME_WINDOW)<CR>
noremap <Leader>rJ :call rtags#JumpTo(g:SAME_WINDOW, { '--declaration-only' : '' })<CR>
noremap <Leader>rS :call rtags#JumpTo(g:H_SPLIT)<CR>
noremap <Leader>rV :call rtags#JumpTo(g:V_SPLIT)<CR>
noremap <Leader>rT :call rtags#JumpTo(g:NEW_TAB)<CR>
noremap <Leader>rp :call rtags#JumpToParent()<CR>
noremap <Leader>rf :call rtags#FindRefs()<CR>
noremap <Leader>rF :call rtags#FindRefsCallTree()<CR>
noremap <Leader>rn :call rtags#FindRefsByName(input("Pattern? ", "", "customlist,rtags#CompleteSymbols"))<CR>
noremap <Leader>rs :call rtags#FindSymbols(input("Pattern? ", "", "customlist,rtags#CompleteSymbols"))<CR>
noremap <Leader>rr :call rtags#ReindexFile()<CR>
noremap <Leader>rl :call rtags#ProjectList()<CR>
noremap <Leader>rw :call rtags#RenameSymbolUnderCursor()<CR>
noremap <Leader>rv :call rtags#FindVirtuals()<CR>
noremap <Leader>rb :call rtags#JumpBack()<CR>
noremap <Leader>rC :call rtags#FindSuperClasses()<CR>
noremap <Leader>rc :call rtags#FindSubClasses()<CR>
noremap <Leader>rd :call rtags#Diagnostics()<CR>

" Shougo/defx.nvim
autocmd FileType defx call s:defx_my_settings()

function! s:defx_my_settings() abort
  nnoremap <silent><buffer><expr> <CR>
   \ defx#do_action('drop')
  nnoremap <silent><buffer><expr> c
  \ defx#do_action('copy')
  nnoremap <silent><buffer><expr> m
  \ defx#do_action('move')
  nnoremap <silent><buffer><expr> p
  \ defx#do_action('paste')
  nnoremap <silent><buffer><expr> l
  \ defx#do_action('drop')
  nnoremap <silent><buffer><expr> t
  \ defx#do_action('open','tabnew')
  nnoremap <silent><buffer><expr> E
  \ defx#do_action('drop', 'vsplit')
  nnoremap <silent><buffer><expr> P
  \ defx#do_action('drop', 'pedit')
  nnoremap <silent><buffer><expr> o
  \ defx#do_action('open_or_close_tree')
  nnoremap <silent><buffer><expr> K
  \ defx#do_action('new_directory')
  nnoremap <silent><buffer><expr> N
  \ defx#do_action('new_file')
  nnoremap <silent><buffer><expr> M
  \ defx#do_action('new_multiple_files')
  nnoremap <silent><buffer><expr> C
  \ defx#do_action('toggle_columns',
  \                'mark:indent:icon:filename:type:size:time')
  nnoremap <silent><buffer><expr> S
  \ defx#do_action('toggle_sort', 'time')
  nnoremap <silent><buffer><expr> d
  \ defx#do_action('remove')
  nnoremap <silent><buffer><expr> r
  \ defx#do_action('rename')
  nnoremap <silent><buffer><expr> !
  \ defx#do_action('execute_command')
  nnoremap <silent><buffer><expr> x
  \ defx#do_action('execute_system')
  nnoremap <silent><buffer><expr> yy
  \ defx#do_action('yank_path')
  nnoremap <silent><buffer><expr> .
  \ defx#do_action('toggle_ignored_files')
  nnoremap <silent><buffer><expr> ;
  \ defx#do_action('repeat')
  nnoremap <silent><buffer><expr> h
  \ defx#do_action('cd', ['..'])
  nnoremap <silent><buffer><expr> ~
  \ defx#do_action('cd')
  nnoremap <silent><buffer><expr> q
  \ defx#do_action('quit')
  nnoremap <silent><buffer><expr> <Space>
  \ defx#do_action('toggle_select') . 'j'
  nnoremap <silent><buffer><expr> *
  \ defx#do_action('toggle_select_all')
  nnoremap <silent><buffer><expr> j
  \ line('.') == line('$') ? 'gg' : 'j'
  nnoremap <silent><buffer><expr> k
  \ line('.') == 1 ? 'G' : 'k'
  nnoremap <silent><buffer><expr> <C-l>
  \ defx#do_action('redraw')
  nnoremap <silent><buffer><expr> <C-g>
  \ defx#do_action('print')
  nnoremap <silent><buffer><expr> cd
  \ defx#do_action('change_vim_cwd')
endfunction
call defx#custom#option('_', {
  \ 'winwidth': 40,
  \ 'split': 'vertical',
  \ 'direction': 'topleft',
  \ 'show_ignored_files': 1,
  \ 'buffer_name': 'exproler',
  \ 'toggle': 1,
  \ 'resume': 1,
  \ 'columns': 'indent:icons:filename:mark',
  \ })
autocmd BufWritePost * call defx#redraw()
autocmd BufEnter * call defx#redraw()
call defx#custom#column('git', 'indicators', {
  \ 'Modified'  : '✹',
  \ 'Staged'    : '✚',
  \ 'Untracked' : '✭',
  \ 'Renamed'   : '➜',
  \ 'Unmerged'  : '=',
  \ 'Ignored'   : '☒',
  \ 'Deleted'   : '✖',
  \ 'Unknown'   : '?'
  \ })

" fsharp-language-server
let s:pathFslangServer = '~/Projects/fsharp-language-server/src/FSharpLanguageServer/bin/Release/netcoreapp2.0/FSharpLanguageServer.dll'

" LanguageClient-neovim
let g:LanguageClient_autoStart = 1
let g:LanguageClient_serverCommands = {
	\ 'fsharp': ['dotnet', s:pathFslangServer ],
        \ 'c': ['clangd', '-compile-commands-dir=' . getcwd() . '/build'],
        \ 'cpp': ['clangd', '-compile-commands-dir=' . getcwd() . '/build'],
\ }
nmap <silent> <nowait><Leader>d :call LanguageClient#textDocument_definition()<CR>
nmap <silent> <nowait> K :call LanguageClient#textDocument_hover()<CR>
let s:node = empty($XDG_CONFIG_HOME) ? expand('$HOME/.config') : $XDG_CONFIG_HOME
let g:LanguageClient_hoverPreview = "Never"
nnoremap <F5> :call LanguageClient_contextMenu()<CR>
nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>

" End of file
