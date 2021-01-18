" ~/.config/nvim/plug-config/coc.vim
"
" © 2020 Potato1682.
" Discord: Potato1682#9684
" Email: contact@potato1682.ml
"

let g:coc_global_extensions = [
    \ 'coc-actions',
    \ 'coc-calc',
    \ 'coc-clangd',
    \ 'coc-cord',
    \ 'coc-css',
    \ 'coc-cssmodules',
    \ 'coc-docker',
    \ 'coc-emmet',
    \ 'coc-emoji',
    \ 'coc-eslint',
    \ 'coc-explorer',
    \ 'coc-git',
    \ 'coc-html',
    \ 'coc-java',
    \ 'coc-jest',
    \ 'coc-json',
    \ 'coc-marketplace',
    \ 'coc-omnisharp',
    \ 'coc-pairs',
    \ 'coc-sh',
    \ 'coc-snippets',
    \ 'coc-solargraph',
    \ 'coc-tabnine',
    \ 'coc-toml',
    \ 'coc-tsserver',
    \ 'coc-vetur',
    \ 'coc-vimlsp',
    \ 'coc-xml',
    \ 'coc-yaml',
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

