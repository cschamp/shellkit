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
map \ :se sw=8:se ts=8
set compatible
set expandtab
set number
map # :se invnumber
map & 1G!Gexpand -2
" map @ :se noai1GO/* * $Id: exrc,v 1.3 2002/11/09 00:52:47 schamp Exp $ * * */:se ai
set hlsearch
set incsearch
color greens
syntax on
if &background == "dark"
   highlight Comment cterm=bold ctermfg=green ctermbg=black
   highlight Search cterm=bold ctermfg=white ctermbg=cyan
endif
"
" Comment functions
function! PoundComment()
   map  0i# XXX 
   map  06x
endfunction
function! CComment()
   map  0i/* XXX $a */
   map  07x$xxx
endfunction
autocmd FileType perl call PoundComment()
autocmd FileType python call PoundComment()
autocmd FileType sh call PoundComment()
autocmd FileType c call CComment()
autocmd FileType cpp call CComment()
function! MakeStuff()
   map  0i# XXX 
   map  06x
   set noexpandtab
endfunction
autocmd FileType make call MakeStuff()
