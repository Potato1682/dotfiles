" ~/.config/nvim/general/settings.vim
"
" © 2020 Potato1682.
" Discord: Potato1682#9684
" Email: contact@potato1682.ml
"

" Set the leader key
let g:mapleader = "\<Space>"

syntax enable                      " Enables syntax highlighting
set hidden                         " Required to keep / open multiple buffers
set encoding=UTF-8                 " The encoding neovim displayed
set pumheight=10                   " Makes popup menu smaller
set fileencoding=UTF-8             " The encoding written to file
set ruler                          " Show the cursor position all the time
set cmdheight=2                    " More space for displaying messages
set iskeyword+=-                   " Treat dash separated words as a word text object
set mouse=a                        " Enable your mouse
set splitbelow                     " Horizontal splits will automatically be below
set splitright                     " Vertical splits will automatically be to the right
if has("termguicolors")
  set t_Co=256                     " Support 256 colors
  set termguicolors                " Support 256 colors
endif
set tabstop=4                      " Insert 4 spaces for a tab in default
set softtabstop=4                  " Insert 4 spaces for a tab in default 
set shiftwidth=4                   " Change the number of space characters instead for indentation
set smarttab                       " Makes tabbing smarter will realize you have 2 vs 4
set expandtab                      " Converts tabs to spaces
set smartindent                    " Makes indenting smart
set autoindent                     " Enable automatic indent
set laststatus=2                   " Always display the status line
set number                         " Show line numbers
set cursorline                     " Enable highlighting of the current line
set showtabline=2                  " Always show tabs
set noshowmode                     " We don't need to see things like -- INSERT -- anymore
set nobackup                       " This is recommended by coc
set nowritebackup                  " This is recommended by coc
set updatetime=300                 " Make completion faster
set timeoutlen=100                 " Faster mapped sequence to complete
set formatoptions-=cro             " Stop newline continution of comments
set clipboard=unnamedplus          " Copy paste between vim and everything else
set title                          " Show titles
set noerrorbells                   " Do not play bells
set showcmd                        " Show (partial) command in the last line of the screen
set virtualedit=onemore            " Allow the cursor to move just past the end of the line
set wildmenu                       " Set enhanced mode for command completion
set ignorecase                     " Ignore case in search patterns
set smartcase                      " Override ignorecase if the search pattern contains upper
set viminfo='1000                  " Set viminfo
set sh=zsh                         " Use zsh
if has("patch-8.1.1564")
  set signcolumn=number
else
  set signcolumn=yes
endif

au! BufWritePost $MYVIMRC source % " Auto source when writing to ~/.config/nvim/init.vim alternatively you can run :source $MYVIMRC

" Memorize the file cursor position
if has("autocmd")
  augroup cursorPosition
    autocmd!
    autocmd BufRead *.txt set tw=78
    autocmd BufReadPost gk *
      \ if line("'\"") > 0 && line("'\"") <= line("$") |
      \   exe "normal! g'\"" |
      \ endif
  augroup END
endif

" Save undos to a file
if has("persistent_undo")
  let undo_path = expand('~/.config/nvim/undo')
  exe 'set undodir=' .. undo_path
  set undofile
endif

