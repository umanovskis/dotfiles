" The very basics
syntax on
set tabstop=4
set expandtab
set autoindent

set number
set incsearch
set hlsearch
set ruler

set wildmenu
set wildmode=longest:list,full

" smarter search
set ignorecase
set smartcase

" Toggle relative numbering
nnoremap <C-n> :set rnu!<CR>

" Better splitting
set splitbelow
set splitright

" Window movement

nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-h> <C-w>h

command Vball vertical ball

" Plugins

set runtimepath^=~/.vim/plugin/bundle/ctrlp.vim

" Solarized color in vim

let g:solarized_termcolors=256
let g:solarized_termtrans=1
set background=dark
colorscheme solarized
