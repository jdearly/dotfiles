" plugins
call plug#begin()
" Colors/eye candy
Plug 'gruvbox-community/gruvbox'
Plug 'karb94/neoscroll.nvim' " probably not going to keep this

" LSP stuff
Plug 'neovim/nvim-lspconfig'
Plug 'mfussenegger/nvim-jdtls'
Plug 'hrsh7th/nvim-compe'
Plug 'hrsh7th/vim-vsnip'

" Language support
Plug 'darrikonn/vim-gofmt', { 'do': ':GoUpdateBinaries' }
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

" Git
Plug 'tpope/vim-fugitive'
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
highlight ColorColumn ctermbg=0 guibg=lightgrey
colorscheme gruvbox

" Clunky Java LSP stuff
if has('nvim-0.5')
  augroup lsp
    au!
    au FileType java lua require('jdtls').start_or_attach({cmd = {'java-lsp.sh'}})
  augroup end
endif


" LSPs
lua <<EOF
require'lspconfig'.tsserver.setup{}
require'lspconfig'.clangd.setup {}
require'lspconfig'.pylsp.setup{}
require'lspconfig'.yamlls.setup{}
require'lspconfig'.gopls.setup{
    cmd = {"gopls", "serve"},
    settings = {
      gopls = {
        analyses = {
          unusedparams = true,
        },
        staticcheck = true,
      },
    },
}
require'compe'.setup{
  enabled = true;
  autocomplete = true;
  debug = false;
  min_length = 1;
  preselect = 'enable';
  throttle_time = 80;
  source_timeout = 200;
  resolve_timeout = 800;
  incomplete_delay = 400;
  max_abbr_width = 100;
  max_kind_width = 100;
  max_menu_width = 100;
  documentation = {
    border = { '', '' ,'', ' ', '', '', '', ' ' }, -- the border option is the
    -- same as `|help nvim_open_win|`
    winhighlight = "NormalFloat:CompeDocumentation,FloatBorder:CompeDocumentationBorder",
    max_width = 120,
    min_width = 60,
    max_height = math.floor(vim.o.lines * 0.3),
    min_height = 1,
  };

 source = {
    path = true;
    buffer = true;
    calc = true;
    nvim_lsp = true;
    nvim_lua = true;
    vsnip = true;
    ultisnips = true;
    luasnip = true;
  };
}

-- Other things
require('neoscroll').setup()

EOF

lua require'nvim-treesitter.configs'.setup { highlight = { enable = true }, incremental_selection = { enable = true }, textobjects = { enable = true }}

" let things
let g:gruvbox_contrast_dark='hard'

" Use tab for trigger completion with characters ahead and navigate
inoremap <silent><expr> <TAB>
            \ pumvisible() ? "\<C-n>" :
            \ <SID>check_back_space() ? "\<TAB>" :
            \ coc#refresh()

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1] =~# '\s'
endfunction

inoremap <silent><expr> <c-space> coc#refresh()

"Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" " <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
   inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
   inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif
