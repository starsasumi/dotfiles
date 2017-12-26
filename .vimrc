set nocompatible	" use vim settings
call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-sensible'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree'
Plug 'chriskempson/base16-vim'
Plug 'junegunn/fzf'
Plug 'tpope/vim-surround'

" Initialize plugin system
call plug#end()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Editor settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Switch syntax highlighting on
syntax enable

" Show line numbers
set number

" Allow hidden buffers, don't limit to 1 file per window/split
set hidden

" Standard encoding
set encoding=utf-8

" Vim airline settings
set laststatus=2
let g:airline_theme='base16_3024'
let g:airline#extensions#tabline#enabled=1
let g:airline_powerline_fonts=1
let g:airline_left_sep=''
let g:airline_right_sep=''

" Auto reflesh
:set autoread

" Tags
set tags=./.tags;,.tags

" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Linebreak on 500 characters
set lbr
set tw=500

" Make backspace behave in a sane manner.
set backspace=indent,eol,start

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

" Search settings
set ignorecase          " case insensitive searching
set smartcase           " but become case sensitive if you type uppercase characters
set magic               " change the way backslashes are used in search patterns
set incsearch
set hlsearch
set background=dark

" Allow scrolling
set mouse=a

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Shortcuts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Map leader key to space
let mapleader = " "
let g:mapleader = " "

" switching splits
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-h> <C-W>h
nnoremap <C-l> <C-W>l

" fast saving
nmap <leader>w :w!<cr>
nmap <leader>q :q<cr>
nmap <leader>wq :wq<cr>

" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>te :tabedit 
map <leader>tm :tabmove

" Treat long lines as break lines (useful when moving around in them)
map j gj
map k gk

" Toggle NerdTree
map <C-\> :NERDTreeToggle<cr>

" Toggle paste mode on and off
map <leader>pp :setlocal paste!<cr>

" Active fzf
map <C-p> :FZF<cr>

" Base16
if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif

