set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Bundle 'powerline/powerline', {'rtp': 'powerline/bindings/vim/'}
" Plugins 
" Plugin 'scrooloose/nerdtree'

Plugin 'altercation/vim-colors-solarized'
 	
Plugin 'valloric/youcompleteme'

Plugin 'myusuf3/numbers.vim'

" Plugin 'kakkyz81/evervim'

Plugin 'godlygeek/tabular'

Plugin 'plasticboy/vim-markdown'

call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on

noremap ; :
nnoremap <Leader>l :EvervimNotebookList<CR>
nnoremap <Leader>s :EvervimSearchByQuery<Space>
nnoremap <Leader>c :EvervimCreateNote<CR>
nnoremap <Leader>t :EvervimListTags<CR>

syntax enable
set shiftwidth=4    " Indents will have a width of 4
let g:evervim_devtoken='S=s692:U=99850e3:E=16284288d8d:C=15b2c775dc0:P=1cd:A=en-devtoken:V=2:H=c0cef74ee639f50aa211f6a7721f34cb'
  if has("autocmd")

    au BufReadPost *.rkt,*.rktl set filetype=scheme

  endif

set background=dark
colorscheme solarized
set backspace=indent,eol,start
set guifont=Menlo:h16
set number
set tabstop=4
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.\+/
"autocmd vimenter * NERDTree
