set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=**/coverage/*
set wildignore+=**/node_modules/*
set wildignore+=**/android/*
set wildignore+=**/ios/*
set wildignore+=**/.git/*

" plugins
call plug#begin()
" Colors/eye candy
Plug 'gruvbox-community/gruvbox'
Plug 'luisiacc/gruvbox-baby'
Plug 'karb94/neoscroll.nvim' " probably not going to keep this

" LSP stuff
Plug 'neovim/nvim-lspconfig'
Plug 'mfussenegger/nvim-jdtls'
Plug 'hrsh7th/nvim-compe'
Plug 'hrsh7th/vim-vsnip'

" Language support
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
" Plug 'glepnir/lspsaga.nvim'
" Plug 'simrat39/symbols-outline.nvim'

" Debugging
Plug 'mfussenegger/nvim-dap'
" Plug 'puremorning/vimspector'

" Tree sitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} 
" Plug 'nvim-treesetter/playground'

Plug 'jceb/vim-orgmode'
Plug 'vim-airline/vim-airline'

" Fuzzy 
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

" Git
Plug 'tpope/vim-fugitive'

" Pretty 
Plug 'sbdchd/neoformat'

call plug#end()

" set things
syntax on
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set number
set colorcolumn=80
set completeopt=menuone,noselect
set scrolloff=8
highlight ColorColumn ctermbg=0 guibg=lightgrey
colorscheme gruvbox

lua require("lsp")
lua require'nvim-treesitter.configs'.setup { highlight = { enable = true }, incremental_selection = { enable = true }, textobjects = { enable = true }}

" let things
let g:gruvbox_contrast_dark='hard'

inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

augroup highlight_yank
    autocmd!
    autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank({timeout = 40})
augroup END
