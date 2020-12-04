" ~/.config/nvim/plug-config/coc.vim
"
" © 2020 Potato1682.
" Discord: Potato1682#9684
" Email: contact@potato1682.ml
"

let g:coc_global_extensions = [
    \ 'coc-actions',
    \ 'coc-json',
    \ 'coc-git',
    \ 'coc-explorer',
    \ 'coc-calc',
    \ 'coc-eslint',
    \ 'coc-css',
    \ 'coc-cssmodules',
    \ 'coc-omnisharp',
    \ 'coc-sh',
    \ 'coc-snippets',
    \ 'coc-tabnine',
    \ 'coc-tsserver',
    \ 'coc-vetur',
    \ 'coc-yaml',
    \ 'coc-html',
    \ 'coc-pairs',
    \ 'coc-emoji',
    \ 'coc-docker',
    \ 'coc-jest',
    \ 'coc-vimlsp',
    \ 'coc-marketplace',
  \ ]

if has("autocmd")
  autocmd CursorHold * silent call CocActionAsync('highlight')

  augroup Format
    autocmd!
    autocmd FileType * setl formatexpr=CocAction('formatSelected')
    autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
  augroup END

  autocmd FileType scss setl iskeyword+=@-@
endif

