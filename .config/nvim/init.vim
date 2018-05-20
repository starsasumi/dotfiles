set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
let g:python_host_prog = 'python'
let g:python3_host_prog = 'python3'
source ~/.vimrc

" workaround for issue https://github.com/neovim/neovim/issues/5873
language en_US

