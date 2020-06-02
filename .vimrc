syntax on
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey

call plug#begin()
Plug 'gruvbox-comnmunity/gruvbox'
Plug 'neoclide/coc.vim', {'branch': 'release'}
call plug#end()

colorscheme gruvbox
set background=dark
