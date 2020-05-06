syntax on
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey

call plug#begin()
Plug 'ycm-core/YouCompleteMe'
Plug 'morhetz/gruvbox'
call plug#end()

colorscheme gruvbox
set background=dark
