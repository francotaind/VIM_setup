#!/bin/bash

# Function to install Neovim
install_neovim() {
    echo "Installing Neovim..."
    if [[ "$OSTYPE" == "linux-gnu"* ]]; then
        sudo apt update
        sudo apt install -y neovim
    elif [[ "$OSTYPE" == "darwin"* ]]; then
        brew install neovim
    else
        echo "Unsupported OS. Please install Neovim manually."
        exit 1
    fi
}

# Function to install Node.js
install_nodejs() {
    echo "Installing Node.js..."
    if [[ "$OSTYPE" == "linux-gnu"* ]]; then
        sudo apt install -y nodejs npm
    elif [[ "$OSTYPE" == "darwin"* ]]; then
        brew install node
    else
        echo "Unsupported OS. Please install Node.js manually."
        exit 1
    fi
}

# Function to install vim-plug
install_vim_plug() {
    echo "Installing vim-plug..."
    curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
}

# Function to set up Neovim configuration
setup_neovim_config() {
    echo "Setting up Neovim configuration..."
    mkdir -p ~/.config/nvim
    cat <<EOF > ~/.config/nvim/init.vim
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
let g:coc_global_extensions = [
  \ 'coc-pyright',
  \ 'coc-tsserver',
  \ 'coc-json',
  \ 'coc-html',
  \ 'coc-css',
\]

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

EOF

    echo "Installing plugins with vim-plug..."
    nvim +PlugInstall +qall
}

# Run the functions
install_neovim
install_nodejs
install_vim_plug
setup_neovim_config

echo "Installation and setup complete. You can now use Neovim with coc.nvim."

