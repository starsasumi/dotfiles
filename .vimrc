set nocompatible	" use vim settings
call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-sensible'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree'
Plug 'chriskempson/base16-vim'
Plug 'junegunn/fzf'
Plug 'tpope/vim-surround'
Plug 'Valloric/YouCompleteMe'
Plug 'tpope/vim-commentary'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

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

" Auto reflesh
set autoread

" Tags
set tags=./.tags;,.tags

" Use 2 spaces instead of tab for indention
set expandtab
set shiftwidth=2
set softtabstop=2

" Be smart when using tabs ;)
set smarttab

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
" Vanilla Shortcuts
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

" Buffers
map <leader>bb :buffers<cr>
map <leader>bo :b 
map <leader>bd :bd 

" Clipboard
map <leader>cc "*

" Marks
map <leader>ms :marks<cr>
map <leader>md :delmarks 

" Toggle paste mode on and off
map <leader>pp :setlocal paste!<cr>

" Copy file path and line number (for gdb)
map <leader>% :let @* = expand("%") . ":" . line(".")<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin Shortcuts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Toggle NerdTree
map <C-\> :NERDTreeToggle<cr>

" Active fzf
map <C-p> :FZF<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-airline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set laststatus=2
let g:airline_theme='base16_3024'
let g:airline#extensions#tabline#enabled=1
let g:airline_powerline_fonts=1
let g:airline_left_sep=''
let g:airline_right_sep=''

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" UltiSnips
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<C-j>"
let g:UltiSnipsListSnippets="<C-l>"
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsSnippetsDir=expand("~/.vim/UltiSnips")

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" YouCompleteMe
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ycm_confirm_extra_conf = 0
let g:ycm_min_num_identifier_candidate_chars = 2
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_complete_in_strings=1
let g:ycm_server_log_level = 'info'
let g:ycm_show_diagnostics_ui = 0
let g:ycm_add_preview_to_completeopt = 0
set completeopt=menu,menuone
" Use Ctrl+Space to trigger semantic completion
" let g:ycm_key_invoke_completion = '<c-z>'
" noremap <c-z> <NOP>
let g:ycm_filetype_whitelist = {'c': 1, 'cc': 1, 'cpp': 1, 'objc': 1}
let g:ycm_semantic_triggers =  {
           \ 'c,cpp,python,java,go,erlang,perl': ['re!\w{2}'],
           \ 'cs,lua,javascript': ['re!\w{2}'],
           \ }

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" base16
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif

