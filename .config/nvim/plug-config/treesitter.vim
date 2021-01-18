" ~/.config/nvim/plug-config/treesitter.vim
"
" © 2020 Potato1682.
" Discord: Potato1682#9684
" Email: contact@potato1682.ml
"

" Set config in lua lang
lua <<EOF
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
  },
  ensure_installed = 'maintained',
}
EOF

