" ~/.config/nvim/themes/one.vim
"
" © 2020 Potato1682.
" Discord: Potato1682#9684
" Email: contact@potato1682.ml
"

colorscheme one

hi Comment cterm=italic

function! ChangeTheme(theme)
  if a:theme == 'dark'
    set background=dark

    hi IndentGuidesOdd  ctermbg=darkgrey
    hi IndentGuidesEven ctermbg=darkgrey
  elseif a:theme == 'light'
    set background=light

    hi IndentGuidesOdd  ctermbg=lightgrey
    hi IndentGuidesEven ctermbg=lightgrey
  endif

  runtime autoload/lightline/colorscheme/one.vim
  
  call lightline#init()
  call lightline#colorscheme()
  call lightline#update()
  tabnew | bdelete
endfunction

command! -nargs=0 Dark call ChangeTheme('dark')
command! -nargs=0 Light call ChangeTheme('light')

