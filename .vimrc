" The very basics
syntax on
set tabstop=8
set softtabstop=4
set shiftwidth=4
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

" Tabs
nnoremap <F2> :tabp<Enter>
inoremap <F2> <Esc>:tabp<Enter>
nnoremap <F3> :tabn<Enter>
inoremap <F3> <Esc>:tabn<Enter>

command Vball vertical ball

" Plugins

set runtimepath^=~/.vim/plugin/bundle/ctrlp.vim
set runtimepath^=~/.vim/plugin/bundle/nerdtree

nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <Leader>f :NERDTreeFind<CR>

autocmd VimEnter * if argc() == 0 || argc() > 1 | NERDTree | endif

" Solarized color in vim

let g:solarized_termcolors=256
let g:solarized_termtrans=1
set background=dark
colorscheme solarized
