" ~/.config/nvim/themes/settings.vim
"
" © 2020 Potato1682.
" Discord: Potato1682#9684
" Email: contact@potato1682.ml
"

let g:nvcode_termcolors = 256

hi Comment cterm=italic

function! ChangeTheme(theme)
    if a:theme == 'dark'
        colorscheme onedark
        set background=dark
    elseif a:theme == 'light'
        colorscheme one
        set background=light
    endif

    runtime autoload/lightline/colorscheme/one.vim

    call lightline#init()
    call lightline#colorscheme()
    call lightline#update()

    tabnew | bdelete
endfunction

command! -nargs=0 Dark  call ChangeTheme('dark')
command! -nargs=0 Light call ChangeTheme('light')

colorscheme onedark

