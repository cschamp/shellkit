".vimrc
map g 1G
map e $
map - :n#
map , !}fmt -c
map ; !}fmt -c -w 57
set ai
set aw
set ts=3
set sw=3
set ht=4
map \ :se sw=8
:se ts=8
set nocompatible
set expandtab
set number
set diffopt+=iwhite
map # :se invnumber
map & 1G!Gexpand -2
" map @ :se noai
1GO/*
 * $Id: exrc,v 1.3 2002/11/09 00:52:47 schamp Exp $
 *
 *
 */
:se ai
set hlsearch
set incsearch
set wildmenu
set smartcase
set spelllang=en_us
color greens
autocmd BufRead,BufNewFile *.rs setfiletype rust
syntax on
if &background == "dark"
   highlight Comment cterm=bold ctermfg=green ctermbg=black
   highlight Search cterm=bold ctermfg=white ctermbg=cyan
   highlight LineNr cterm=None
endif
" whitespace handling
highlight WhiteSpaceEOL ctermbg=red guibg=red
match WhiteSpaceEOL /\s\+$/
autocmd WinEnter * match WhiteSpaceEOL /\s\+$/
"
" Language functions
function! PythonStuff()
   map  0i# XXX 
   map  06x
   set omnifunc=pythoncomplete#Complete
endfunction
function! PoundComment()
   map  0i# XXX 
   map  06x
endfunction
function! CComment()
   map  0i/* XXX $a */
   map  07x$xxx
endfunction
autocmd FileType perl call PoundComment()
autocmd FileType python call PythonStuff()
autocmd FileType sh call PoundComment()
autocmd FileType c call CComment()
autocmd FileType cpp call CComment()
function! MakeStuff()
   map  0i# XXX 
   map  06x
   set noexpandtab
endfunction
autocmd FileType make call MakeStuff()
" If you prefer the Omni-Completion tip window to close when a selection is
" made, these lines close it on movement in insert mode or when leaving
" insert mode
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
autocmd BufRead,BufNewFile *.wiki setfiletype Wikipedia
autocmd BufRead,BufNewFile *.wikipedia.org* setfiletype Wikipedia
