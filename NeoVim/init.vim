
set runtimepath^=~\.vim runtimepath+=~\.vim\after
let &packpath = &runtimepath

set guicursor=
set relativenumber
set nohlsearch
set hidden
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nu
set nowrap
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set termguicolors
set scrolloff=8
" set noshowmode
set signcolumn=yes
set isfname+=@-@
" set ls=0

" Give more space for displaying messages.
set cmdheight=1

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=50

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

set colorcolumn=80

" h nvim.txt
"
" c:\tools\neovim

call plug#begin('~/.vim/plugged')
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'tpope/vim-fugitive'

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'nvim-telescope/telescope.nvim'

Plug 'neovim/nvim-lspconfig' "-- native LSP support
Plug 'hrsh7th/nvim-cmp' "-- autocompletion framework
Plug 'hrsh7th/cmp-nvim-lsp' "-- LSP autocompletion provider

Plug 'gruvbox-community/gruvbox'
Plug 'jreybert/vimagit'
call plug#end()

colorscheme gruvbox
set background=dark

highlight Normal guibg=none

" remaps mode lhs rhs
let mapleader = " "
nnoremap <leader>ps :lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For >") })<CR>
nnoremap <silent> <C-p> :GFiles<CR>
nnoremap <silent> <C-P> :Files<CR>

"let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8' } }
let $FZF_DEFAULT_OPTS='--reverse'
nnoremap <leader>gc :GCheckout<CR>


"LSP stuff
nnoremap <leader>vd :lua vim.lsp.buf.definition()<CR>
nnoremap <leader>vi :lua vim.lsp.buf.implementation()<CR>
nnoremap <leader>vsh :lua vim.lsp.buf.signature_help()<CR>
nnoremap <leader>vrr :lua vim.lsp.buf.references()<CR>
nnoremap <leader>vrn :lua vim.lsp.buf.rename()<CR>
nnoremap <leader>vh :lua vim.lsp.buf.hover()<CR>
nnoremap <leader>vca :lua vim.lsp.buf.code_action()<CR>
nnoremap <leader>vsd :lua vim.lsp.diagnostic.show_line_diagnostics(); vim.lsp.util.show_line_diagnostics()<CR>
nnoremap <leader>vn :lua vim.lsp.diagnostic.goto_next()<CR>
nnoremap <leader>vll :call LspLocationList()<CR>
