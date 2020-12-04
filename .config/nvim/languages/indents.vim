" ~/.config/nvim/languages/indents.vim
"
" © 2020 Potato1682.
" Discord: Potato1682#9684
" Email: contact@potato1682.ml
"

if has("autocmd")
  augroup fileIndent
    autocmd!
    autocmd BufNewFile,BufRead *.vim setlocal " Indent spaces for vim file
      \ tabstop=2
      \ softtabstop=2
      \ shiftwidth=2
    autocmd FileType make set noexpandtab shiftwidth=8 softtabstop=0
  augroup END
endif

