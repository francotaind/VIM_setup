" Specify a directory for plugins
call plug#begin('~/.local/share/nvim/plugged')

" coc.nvim for autocompletion
Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()
" Map <Leader>t to open a new tab
nnoremap <Leader>t :tabnew<CR>

" Map <Leader>tn to go to the next tab
nnoremap <Leader>tn :tabnext<CR>

" Map <Leader>tp to go to the previous tab
nnoremap <Leader>tp :tabprevious<CR>

" Map <Leader>tc to close the current tab
nnoremap <Leader>tc :tabclose<CR>

" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <silent><expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <silent><expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Use <CR> to confirm completion
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"

" Optional: Configure Coc to use language servers
" This example shows how to configure Coc to use the Python language server
let g:coc_global_extensions = ['coc-pyright']

" Show line numbers
set number

" Status bar
set laststatus=2

" Set syntax highlighting
syntax on

syntax on
filetype on
set noswapfile
set number
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set autoindent
set textwidth=80
set nobackup
set hlsearch
set showmatch
inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O
