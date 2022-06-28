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
Plug 'karb94/neoscroll.nvim' " probably not going to keep this
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
Plug 'itchyny/lightline.vim'

" LSP stuff
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'mfussenegger/nvim-jdtls'

" Language support
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
" Plug 'glepnir/lspsaga.nvim'
" Plug 'simrat39/symbols-outline.nvim'
Plug 'fladson/vim-kitty'

" Debugging
Plug 'mfussenegger/nvim-dap'
" Plug 'puremorning/vimspector'

" Tree sitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} 
Plug 'nvim-treesetter/playground'

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
set completeopt=menu,menuone,noselect
set scrolloff=8
set noshowmode
highlight ColorColumn ctermbg=0 guibg=lightgrey

let g:lightline = {'colorscheme': 'tokyonight'}
let g:tokyonight_style = "night"
let g:tokyonight_italic_keywords = 0
let g:tokyonight_italic_comments = 0

let g:tokyonight_colors = {
  \ 'hint': 'orange',
  \ 'error': '#ff0000'
\ }
colorscheme tokyonight 

lua require("lsp")

inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

augroup highlight_yank
    autocmd!
    autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank({timeout = 40})
augroup END
