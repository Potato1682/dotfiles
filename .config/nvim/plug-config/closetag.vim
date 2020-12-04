" ~/.config/nvim/plug-config/closetag.vim
"
" © 2020 Potato1682.
" Discord: Potato1682#9684
" Email: contact@potato1682.ml
"

let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.ejs,*.erb'
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx,*.tsx'
let g:closetag_filetypes = 'html,xhtml,phtml,ejs,tjs'
let g:closetag_regions = {
    \ 'typescript.tsx': 'jsxRegion,tsxRegion',
    \ 'javascript.tsx': 'jsxRegion'
  \ }

