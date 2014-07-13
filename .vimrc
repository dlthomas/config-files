set nocompatible
set scrolloff=2
set number
set hlsearch
colorscheme default

nmap <silent> M :make install<Cr>

filetype plugin on
syntax on
syntax sync fromstart

try
        source ./.vimlocal
catch /^Vim\%((\a\+)\)\=:E484/
endtry

map <S-Tab> :cprev
map <Tab> :cnext
