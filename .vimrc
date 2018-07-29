" # Plug {{{
" ---------------------------------------------------------
set nocompatible " use vim settings
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
Plug 'ludovicchabant/vim-gutentags'

" Initialize plugin system
call plug#end()
" In order to be able to override vim-sensible's settings, we load it first
runtime plugin/sensible.vim
" }}}

" # Basic settings {{{
" ---------------------------------------------------------
syntax enable  " Switch syntax highlighting on
set number  " Show line numbers
set hidden  " Allow hidden buffers, don't limit to 1 file per window/split
set encoding=utf-8  " Standard encoding
set autoread  " Auto reflesh
set tags=./.tags;,.tags  " Tags
set mouse=a  " Allow scrolling
set smarttab  " Be smart when using tabs ;)
set backspace=indent,eol,start  " Make backspace behave in a sane manner.

" Use 2 spaces instead of tab for indention
set expandtab
set shiftwidth=2
set softtabstop=2

" Linebreak on 500 characters
set linebreak
set textwidth=500
set colorcolumn=80 " highlight column 80

set autoindent
set smartindent
set wrap

" Search settings
set ignorecase      " case insensitive searching
set smartcase       " but become case sensitive if you type uppercase characters
set magic           " change the way backslashes are used in search patterns
set incsearch
set hlsearch
set background=dark
" }}}

" # Basic shortcuts {{{
" ---------------------------------------------------------
" Map leader to <Space> and local leader to ,
let mapleader = " "
let g:mapleader = " "
let maplocalleader = ","
let g:maplocalleader = ","

" No more :
nnoremap <leader><leader> :

"help
nnoremap <leader>h :help 

" Do not open command-line window when I quit too fast. See `:help q:`
nnoremap q: <NOP>

" Fast saving and quitting
nnoremap <leader>w :w<cr>
nnoremap <leader>q :q<cr>

" Moveing around
noremap H ^
noremap L $
" Treat long lines as break lines (useful when moving around in them)
noremap j gj
noremap k gk

" Switching splits
nnoremap <leader>sp :split<cr>
nnoremap <leader>vs :vsplit<cr>
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-h> <C-W>h
nnoremap <C-l> <C-W>l

" Useful mappings for managing tabs
nnoremap <leader>tn :tabnew<cr>
nnoremap <leader>to :tabonly<cr>
nnoremap <leader>tc :tabclose<cr>
nnoremap <leader>te :tabedit 
nnoremap <leader>tm :tabmove

" Buffers
nnoremap <leader>bb :buffers<cr>
nnoremap <leader>bo :b 
nnoremap <leader>bd :bd<cr>

" Marks
nnoremap <leader>ms :marks<cr>
nnoremap <leader>md :delmarks 

" Toggle paste mode on and off
nnoremap <leader>pp :setlocal paste!<cr>

" Clipboard
nnoremap <leader>cc "+
" Copy file path and line number (for gdb)
nnoremap <leader>% :let @+ = expand("%") . ":" . line(".")<cr>

" Quote a word
nnoremap <leader>' viw<Esc>a'<Esc>bi'<Esc>lel
nnoremap <leader>" viw<Esc>a"<Esc>bi"<Esc>lel
vnoremap <leader>' <Esc>`<i'<Esc>`>a'<Esc>
vnoremap <leader>" <Esc>`<i"<Esc>`>a"<Esc>

" Search selected text
" BTW, you can search word under cursor with * and #
vnoremap / y/<C-r>"<cr>
vnoremap ? y?<C-r>"<cr>
" }}}

" # vimscript {{{
" ---------------------------------------------------------
augroup filetype_vim
  autocmd!
  autocmd FileType vim setlocal foldmethod=marker
augroup END
" }}}

" # Plugin Shortcuts {{{
" ---------------------------------------------------------
" Toggle NerdTree
nnoremap <C-\> :NERDTreeToggle<cr>

" YCM
nnoremap <F3> :YcmCompleter GoTo<cr>

" fzf
nnoremap <C-p> :FZF<cr>
" }}}

" # fzf {{{
" ---------------------------------------------------------
" Only search for tracked file
let $FZF_DEFAULT_COMMAND = 'git ls-files --recurse-submodules'
" }}}

" # vim-airline {{{
" ---------------------------------------------------------
set laststatus=2
let g:airline_theme='base16_3024'
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline_powerline_fonts=1
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#right_alt_sep = '|'
" }}}

" # UltiSnips {{{
" ---------------------------------------------------------
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<C-j>"
let g:UltiSnipsListSnippets="<C-l>"
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsSnippetsDir=expand("~/.vim/UltiSnips")
" }}}

" # YouCompleteMe {{{
" ---------------------------------------------------------
let g:ycm_confirm_extra_conf = 0
let g:ycm_min_num_identifier_candidate_chars = 2
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_complete_in_strings=1
let g:ycm_server_log_level = 'info'
let g:ycm_show_diagnostics_ui = 0
let g:ycm_add_preview_to_completeopt = 0
set completeopt=menu,menuone
" Use Ctrl+Space to trigger semantic completion
let g:ycm_key_invoke_completion = '<C-Space>'
let g:ycm_filetype_whitelist = {'c': 1, 'cc': 1, 'cpp': 1, 'objc': 1}
let g:ycm_semantic_triggers =  {
  \ 'c,cpp,python,java,go,erlang,perl': ['re!\w{2}'],
  \ 'cs,lua,javascript': ['re!\w{2}'],
\ }
" }}}

" # Gutentags {{{
" ---------------------------------------------------------
let g:gutentags_project_root = ['.root', '.git', '.project', '.ycm_extra_conf.py']
let g:gutentags_cache_dir = expand('~/.cache/tags')

let g:gutentags_modules = []
" Support ctags
" if executable('ctags')
"   let g:gutentags_modules += ['ctags']
"   let g:gutentags_ctags_tagfile = '.tags'
"   let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
"   let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
"   let g:gutentags_ctags_extra_args += ['--c-kinds=+px']
" endif

" Support gtags (GNU Global) through vim's cscope interface
if executable('gtags-cscope') && executable('gtags')
  set cscopeprg=gtags-cscope
  let g:gutentags_modules += ['gtags_cscope']
  let g:gutentags_auto_add_gtags_cscope = 1
endif

" Only generate tags for tracked files
let g:gutentags_file_list_command = 'git ls-files --recurse-submodules'
" }}}

" # base16 {{{
" ---------------------------------------------------------
if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif
" }}}

" # Local configuration {{{
" ---------------------------------------------------------
if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif
" }}}
