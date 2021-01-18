" ~/.config/nvim/plug-config/lightline.vim
"
" © Potato1682.
" Discord: Potato1682#9684
" Email: contact@potato1682.ml
"

let g:lightline = {
  \ 'colorscheme': 'one',
  \ 'separator': {
  \   'left': "\ue0b0",
  \   'right': "\ue0b2"
  \ },
  \ 'subseparator': {
  \   'left': "\ue0b1",
  \   'right': "\ue0b3"
  \ },
  \ 'active': {
  \   'left': [
  \     [ 'mode', 'paste' ],
  \     [ 'fugitive', 'diagnostic' ],
  \     [ 'coc_errors', 'coc_warnings', 'coc_ok' ],
  \     [ 'coc_status' ],
  \     [ 'filename', 'method' ]
  \   ],
  \   'right': [
  \     [ 'fileencoding', 'percent', 'lineinfo' ],
  \     [ 'blame' ],
  \   ]
  \ },
  \ 'component': {
  \   'lineinfo': ' %3l:%-2v%<',
  \   'percent': '☰ %3p%%',
  \ },
  \ 'component_function': {
  \   'blame': 'LightlineGitBlame',
  \   'filename': 'LightlineFname',
  \   'readonly': 'LightlineReadonly',
  \   'fugitive': 'LightlineFugitive',
  \   'method': 'NearestMethodOrFunction'
  \ },
  \ 'tab': {
  \   'active': [ 'readonly', 'filetype', 'filename', 'modified', 'close' ],
  \   'inactive': [ 'readonly', 'filename', 'modified', 'close' ]
  \ },
  \ 'tab_component_function': {
  \   'filetype': 'LightlineTabFiletypeIcon',
  \   'readonly': 'LightlineTabReadonly',
  \   'modified': 'LightlineTabModified'
  \ }
\ }

function! LightlineGitBlame() abort
  return winwidth(0) > 120 ? get(b:, 'coc_git_blame', '') : ''
endfunction

function! LightlineReadonly()
  return &readonly ? '' : ''
endfunction

function! LightlineFugitive()       
  if exists('*FugitiveHead')
    let branch = FugitiveHead()
    return branch !=# '' ? ' ' . branch : ''
  endif
  return ''
endfunction

function! LightlineModified()
  return &ft =~ 'help' ? '' : &modified ? '' : &modifiable ? '' : '-'
endfunction

function! LightlineFileformat()
  return &fileencoding . ' ' . FileFormatIcon()
endfunction

function! FileFormatIcon()
  return strlen(&filetype) ? WebDevIconsGetFileFormatSymbol() : ''
endfunction

function! LightlineFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : '') : ''
endfunction

function! LightlineFname() 
  let icon = (strlen(&filetype) ? WebDevIconsGetFileTypeSymbol() . ' ' : ' ') 
  let filename = LightlineFilename()
  let modified = ModifiedStatus()
  if filename == ''
      return ''
  endif
  return join([icon, filename, modified],'')
endfunction

function! LightlineFilename()
  let readonly = LightlineReadonly()
  return ('' != readonly ? readonly . ' ' : '') .
    \ ('' != expand('%:t') ? expand('%:t') : '')
endfunction

function! ModifiedStatus()
  let modified = LightlineModified()
  return ('' != modified ? ' ' . modified : '')
endfunction

function! LightlineTabModified(n)
  let winnr = tabpagewinnr(a:n)
  return &ft =~ 'help' ? '' : gettabwinvar(a:n, winnr, '&modified') ? '' : gettabwinvar(a:n, winnr, '&modifiable') ? '' : '-'
endfunction

function! LightlineTabReadonly(n)
  let winnr = tabpagewinnr(a:n)
  return gettabwinvar(a:n, winnr, '&readonly') ? '' : ''
endfunction

function! LightlineTabFiletypeIcon(n)
  let fticon = WebDevIconsGetFileTypeSymbol()
  return fticon !=# '' ? fticon : " "
endfunction

function! NearestMethodOrFunction() abort
  return get(b:, 'vista_nearest_method_or_function', '')
endfunction

let g:lightline#coc#indicator_errors = "\uf057"
let g:lightline#coc#indicator_warnings = "\uf071"
let g:lightline#coc#indicator_ok = "\uf00c"

call lightline#coc#register()

