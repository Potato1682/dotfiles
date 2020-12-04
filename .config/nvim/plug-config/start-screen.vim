" ~/.config/nvim/plug-config/start-screen.vim
"
" © 2020 Potato1682.
" Discord: Potato1682#9684
" Email: contact@potato1682.ml
"

let g:startify_session_dir = '~/.config/nvim/session'

let g:startify_lists = [
    \ { 'type': 'files',     'header': ['   Files']                        },
    \ { 'type': 'dir',       'header': ['   Current Directory '. getcwd()] },
    \ { 'type': 'sessions',  'header': ['   Sessions']                     },
    \ { 'type': 'bookmarks', 'header': ['   Bookmarks']                    },
  \ ]

let g:startify_bookmarks = [
    \ { 'i': '~/.config/nvim/init.vim' },
    \ { 'z': '~/.zshrc'                },
    \ { 't': '~/.tmux.conf'            },
  \ ]

let g:startify_session_autoload = 1
let g:startify_session_delete_buffers = 1
let g:startify_change_to_vcs_root = 1
let g:startify_fortune_use_unicode = 1
let g:startify_session_persistence = 1
let g:startify_enable_special = 0

let g:startify_custom_header = [
    \ '     _/\/\/\/\/\____/\/\/\/\/\/\__/\/\/\/\/\/\____________/\/\/\/\/\/\__/\/\/\/\/\____/\/\/\/\__/\/\/\/\/\/\____/\/\/\/\____/\/\/\/\/\___',
    \ '    _/\/\____/\/\______/\/\__________/\/\________________/\____________/\/\____/\/\____/\/\________/\/\______/\/\____/\/\__/\/\____/\/\_',
    \ '   _/\/\/\/\/\________/\/\__________/\/\______/\/\/\/\__/\/\/\/\/\____/\/\____/\/\____/\/\________/\/\______/\/\____/\/\__/\/\/\/\/\___',
    \ '  _/\/\______________/\/\__________/\/\________________/\/\__________/\/\____/\/\____/\/\________/\/\______/\/\____/\/\__/\/\__/\/\___',
    \ ' _/\/\______________/\/\__________/\/\________________/\/\/\/\/\/\__/\/\/\/\/\____/\/\/\/\______/\/\________/\/\/\/\____/\/\____/\/\_'
  \ ]

